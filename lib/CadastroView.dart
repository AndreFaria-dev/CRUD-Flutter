import 'package:crud/CadastroModel.dart';
import 'package:crud/Helpers/database_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class CadastroView extends StatelessWidget {
  //Instanciando objeto
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  //Variaveis a serem passadas no formulário
  final TextEditingController _nomecontroller = TextEditingController();
  final TextEditingController _telefonecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _senha1controller = TextEditingController();
  final TextEditingController _senha2controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var raisedButton = RaisedButton(
      child: Text("Enviar"),
      onPressed: () {
        if (_senha1controller.text == _senha2controller.text) {
          //Envia os dados para a classe model
          //Grava no banco de dados
          _inserir();
        } else {
          print("As senhas não coincidem");
        }
      },
    );
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                "Preencha os dados",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: _nomecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(0),
                    ),
                  ),
                  labelText: "Nome",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: _telefonecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(0),
                  )),
                  labelText: "Telefone",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: _emailcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(0),
                  )),
                  labelText: "E-mail",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text("Senha"),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: _senha1controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(0),
                  )),
                  labelText: "Informe a sua senha",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: _senha2controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(0),
                  )),
                  labelText: "Confirme sua senha",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: raisedButton,
            ),
          ],
        ),
      ),
    );
  }

  void _inserir() async {
    Usuario novoUsuario = Usuario(
      _nomecontroller.text,
      _emailcontroller.text,
      _telefonecontroller.text,
      _senha1controller.text,
    );

    Map<String, dynamic> row = {
      DatabaseHelper.colunaNome: novoUsuario.nome,
      DatabaseHelper.colunaTelefone: novoUsuario.telefone,
      DatabaseHelper.colunaEmail: novoUsuario.email,
      DatabaseHelper.colunaSenha: novoUsuario.senha
    };

    final id = await dbHelper.insert(row);
    print("Usuário inserido $id");
  }
}

class BemVindoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            new Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.topRight,
                  colors: [c1, c2],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                "Seja bem vindo ao App",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: RaisedButton(
                child: Text("Começar"),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
