import 'package:crud/CadastroModel.dart';
import 'package:crud/Helpers/UsuarioHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*  Essa tela exibirá os usuários cadastrados */

UsuarioHelper _db = UsuarioHelper.instance;
List<Usuario> listausuario = List<Usuario>(); 

void main() => runApp(ListaView());

class ListaView extends StatefulWidget {

  

  @override
  _ListaViewState createState() => _ListaViewState();




}

class _ListaViewState extends State<ListaView> {


  
@override
  void initState() {
    // Executar métodos com prioridade
    super.initState();

    recuperarUsuario();
  }

  @override
  Widget build(BuildContext context) {

    recuperarUsuario();

    return Scaffold(
      appBar: AppBar(title: Text("Usuários cadastrados"),),
      body: _construirListView()
    );
  }
}

void recuperarUsuario() async {
  //print("RECUPERAR USUARIO");

  List usuariosRecuperados = await _db.listarUsuarios();
  //print("Dados recuperados: "+ usuariosRecuperados.toString());

  List<Usuario> listatemp = [];

  for (var item in usuariosRecuperados) {
    Usuario u = Usuario.fromMap(item);
    listatemp.add(u);

  }

  listausuario = listatemp;
  listatemp = null;

}

_construirListView() {

return ListView.builder(
  itemCount: listausuario.length,
  itemBuilder: (context, i){
    final Usuario obj = listausuario[i];
    if (listausuario.length > 0) {
    return ListTile(
      title: Text(obj.nome),
      subtitle: Text(obj.email),
      onTap: (){
        print(obj.nome);
      },
      onLongPress: (){
        print(obj);
        return _operarContato();
        
      },
    );      
    } else {
      return Text("Nada encontrado");
    }

  },
);
  
}

_operarContato() {

  return AlertDialog(
    title: new Text("O que deseja fazer?"),
    actions: <Widget>[
      new TextButton(onPressed: null, child: new Text("Excluir"))
    ],
  );

}