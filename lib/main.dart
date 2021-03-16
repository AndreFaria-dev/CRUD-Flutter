import 'dart:ui';
import 'package:flutter/material.dart';

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
  void _novo_usuario() {}

  void _logar() {
    print(
        "Roda o comando SELECT do banco de dados para verificar se o usuário e senha existem");
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
          new Center(
            child: new ClipRect(
              child: new BackdropFilter(
                filter: new ImageFilter.blur(
                  sigmaX: 20,
                  sigmaY: 20,
                ),
                child: new Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: new BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.5),
                  ),
                  child: new ListView(
                    children: [
                      new Container(
                        margin: EdgeInsets.all(10),
                        child: new TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Login",
                          ),
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.all(10),
                        child: new TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Senha",
                          ),
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.all(10),
                        child: RaisedButton(
                          elevation: 0,
                          hoverElevation: 0,
                          focusElevation: 0,
                          child: Text("Entrar"),
                          onPressed: () => {},
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.all(10),
                        child: RaisedButton(
                          elevation: 0,
                          hoverElevation: 0,
                          focusElevation: 0,
                          child: Text("Criar Usuário"),
                          onPressed: () => {},
                        ),
                      )
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
