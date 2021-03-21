import 'dart:ui';
import 'package:crud/CadastroModel.dart';
import 'package:crud/CadastroView.dart';
import 'package:flutter/material.dart';
import 'package:crud/Helpers/database_helper.dart';
import 'package:sqflite/sqlite_api.dart';

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

  //Dados para autenticar
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _senhacontroller = TextEditingController();

  void _logar() async {
    Database db = await DatabaseHelper.instance.database;

    String sql = "SELECT email, senha FROM usuario WHERE email = '" +
        _emailcontroller.text +
        "' AND senha = '" +
        _senhacontroller.text +
        "'";

    //print(sql);
    //Os dados são alocado em variaveis
    List<Map> result = await db.rawQuery(sql);

    //Exibindo o resultado do select
    result.forEach((row) => print(row));

    //Verificar se retornou apenas uma linha...
  }

  @override
  Widget build(BuildContext context) {
    //
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
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(0),
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
                                Radius.circular(0),
                              ),
                            ),
                            labelText: "Senha",
                          ),
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
                            _logar(),
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
