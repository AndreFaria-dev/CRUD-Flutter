import 'dart:ui';
import 'package:crud/CadastroModel.dart';
import 'package:crud/CadastroView.dart';
import 'package:crud/HomeView.dart';
import 'package:crud/ListaView.dart';
import 'package:flutter/material.dart';
import 'package:crud/Helpers/UsuarioHelper.dart';

//Esquema de cor de fundo
Color c1 = Color(0xff1488CC);
Color c2 = Color(0xff2B32B2);





void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'CRUD Master',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TelaInicialView(title: 'Tela Inicial'));
  }
}

class TelaInicialView extends StatefulWidget {
  TelaInicialView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TelaInicialView> {

  //Criando uma instancia do objeto que referencia o banco de dados
  final dbHelper = UsuarioHelper.instance;

  //Dados para autenticar
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _senhacontroller = TextEditingController();

  List <Usuario> pessoas = List<Usuario>();

  //Método para leitura de dados
  void _listar() async {
    final todasAsLinhas = await dbHelper.queryAllRows();
    
    print(todasAsLinhas[0]);
    todasAsLinhas.forEach((row) => print(row) );
    
  }

  void _autenticar() async {
    
    int numRows = 0;

    final user = await dbHelper.queryLoginAuth(_emailcontroller.text, _senhacontroller.text);
    //print(user);
    user.forEach((row) {
      print(row);
      numRows++;
      }
    );

    print(numRows);

    if (numRows == 1) {

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> HomeView(_emailcontroller.text, _senhacontroller.text)
        ) 
      );
    } else {
          showDialog(context: context, builder: (BuildContext context){

            return AlertDialog(
              title: new Text("Aviso"),
              content: new Text("Erro na autenticação"),
              actions: <Widget>[
                new TextButton(onPressed: (){Navigator.of(context).pop();}, child: new Text("Fechar"))
              ],
            );
          });
    }
  }


  @override
  Widget build(BuildContext context) {
    //Carregar os dados para debug
    _listar();
    return Scaffold(
      body: new Stack(
        children: [
          new Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.topRight,
                colors: [c1, c2],
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Text(
                "Tela de login",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          new Center(
            child: new ClipRect(
              child: new BackdropFilter(
                filter: new ImageFilter.blur(
                  sigmaX: 20,
                  sigmaY: 20,
                ),
                child: new Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: new BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.5),
                  ),
                  child: new ListView(
                    children: [
                      new Container(
                        margin: EdgeInsets.all(10),
                        child: new TextField(
                          controller: _emailcontroller,
                          onTap: ()=>_listar(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(2),
                              ),
                            ),
                            labelText: "E-mail",
                          ),
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.all(10),
                        child: new TextField(
                          controller: _senhacontroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(2),
                              ),
                            ),
                            labelText: "Senha",
                          ),
                          obscureText: true,
                        ),
                      ),
                      new Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: RaisedButton(
                          elevation: 0,
                          hoverElevation: 0,
                          focusElevation: 0,
                          child: Text("Entrar"),
                          onPressed: () => {
                            //Botão entrar

                            //Verificar se o usuário existe no banco
                            _autenticar(),

                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context)=> HomeView()
                            //   ) 
                            // )

                          },
                        ),
                      ),
                      new Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: RaisedButton(
                          elevation: 0,
                          hoverElevation: 0,
                          focusElevation: 0,
                          child: Text("Criar novo usuário"),
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CadastroView(),
                              ),
                            )
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
