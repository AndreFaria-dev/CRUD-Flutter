

import 'package:crud/CadastroModel.dart';
import 'package:crud/Helpers/UsuarioHelper.dart';
import 'package:crud/HomeView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class CadastroView extends StatelessWidget {
  //Instanciando objeto
  final UsuarioHelper dbHelper = UsuarioHelper.instance;

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

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context)=> BemVindoView(

                _nomecontroller.text,
                _emailcontroller.text, 
                _telefonecontroller.text, 
                _senha1controller.text

              ), 
            )
          );
        } else {
          print("As senhas não coincidem");

          showDialog(context: context, builder: (BuildContext context){

            return AlertDialog(
              title: new Text("Aviso"),
              content: new Text("As senhas devem ser iguais"),
              actions: <Widget>[
                new TextButton(onPressed: (){Navigator.of(context).pop();}, child: new Text("Ok"))
              ],
            );
          });
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
                obscureText: true,
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
                obscureText: true
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
      UsuarioHelper.colunaNome: novoUsuario.nome,
      UsuarioHelper.colunaTelefone: novoUsuario.telefone,
      UsuarioHelper.colunaEmail: novoUsuario.email,
      UsuarioHelper.colunaSenha: novoUsuario.senha
    };

    final id = await dbHelper.insert(row);
    print("Usuário inserido $id");
  }

  
}

class BemVindoView extends StatelessWidget {

  
  const BemVindoView(this.nome, this.email, this.fone, this.senha);
  final String nome, fone, email, senha;

  

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
                "Seja bem vindo, "+this.nome,
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: RaisedButton(
                child: Text("Começar"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeView(this.email, this.senha) ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
