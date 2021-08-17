import 'dart:ui';

import 'package:crud/CadastroModel.dart';
import 'package:crud/Helpers/UsuarioHelper.dart';
import 'package:crud/ListaView.dart';
import 'package:flutter/material.dart';

class TelaExitoView extends StatelessWidget {
  Usuario usuariocadastrado;
  UsuarioHelper db = UsuarioHelper.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: new Stack(
          children: [
            new Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.topRight,
                  colors: [Color(0xff1488CC), Color(0xff2B32B2)],
                ),
              ),
            ),
            new Center(
              child: new ClipRect(
                child: new BackdropFilter(
                  filter: new ImageFilter.blur(
                    sigmaX: 10,
                    sigmaY: 20,
                  ),
                  child: new Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: new BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.5),
                    ),
                    child: new ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "Cadastro realizado com sucesso!",
                            style: TextStyle(fontSize: 30),
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
      ),
    );
  }
}


class HomeView extends StatelessWidget {

  
  const HomeView(this.email, this.senha);
  final String email, senha;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: new Stack(
          children: [
            new Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.topRight,
                  colors: [Color(0xff1488CC), Color(0xff2B32B2)],
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
                        Container(

                          margin: EdgeInsets.all(10),
                          child: Center(

                            child: Text(
                              "Seja bem-vindo!",
                              style: TextStyle(
                                fontSize: 25,

                              ),
                            ),

                          )
                          
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: ElevatedButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ListaView()));
                          }, child: Text("Ver contatos"))
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
