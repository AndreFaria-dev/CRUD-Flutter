import 'package:crud/CadastroModel.dart';
import 'package:flutter/material.dart';

class CadastroView extends StatelessWidget {
  //Variaveis a serem passadas no formulário
  final TextEditingController _nomecontroller = TextEditingController();
  final TextEditingController _dtnascimentocontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _senha1controller = TextEditingController();
  final TextEditingController _senha2controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                controller: _dtnascimentocontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(0),
                  )),
                  labelText: "Data de nascimento",
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
              child: RaisedButton(
                child: Text("Enviar"),
                onPressed: () {
                  final Usuario novoUsuario = Usuario(
                    _nomecontroller.text,
                    _emailcontroller.text,
                    _dtnascimentocontroller.text,
                    _senha1controller.text,
                  );

                  _senha1controller.text == _senha2controller.text
                      ? print(novoUsuario)
                      : print("As senhas não coincidem");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
