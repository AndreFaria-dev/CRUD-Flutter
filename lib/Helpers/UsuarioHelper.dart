import 'dart:async';
import 'dart:io';
//
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
//
import 'package:crud/CadastroModel.dart';

class UsuarioHelper {
  static final _databaseName = "exemplo.db";
  static final _databaseVersion = 1;

  static final tabelaUsuarios = 'usuario';
  static final colunaId = '_id';
  static final colunaNome = 'nome';
  static final colunaTelefone = 'telefone';
  static final colunaEmail = 'email';
  static final colunaSenha = 'senha';

  // torna esta classe singleton
  UsuarioHelper._privateConstructor();
  static final UsuarioHelper instance = UsuarioHelper._privateConstructor();
  
  // tem somente uma referência ao banco de dados
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // instancia o db na primeira vez que for acessado
    _database = await _initDatabase();
    return _database;
  }

  // abre o banco de dados e o cria se ele não existir
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = (documentsDirectory.path + _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // Código SQL para criar o banco de dados e preparar a tabela
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tabelaUsuarios (
            $colunaId INTEGER PRIMARY KEY AUTOINCREMENT,
            $colunaNome TEXT NOT NULL,
            $colunaTelefone TEXT NOT NULL,
            $colunaEmail TEXT NOT NULL,
            $colunaSenha TEXT NOT NULL
          )
          ''');
  }

  //Preparar o cadastro do usuário
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tabelaUsuarios, row);
  }


  // Todas as linhas são retornadas como uma lista de mapas, onde cada mapa é
  // uma lista de valores-chave de colunas.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(tabelaUsuarios);
  }
  
  
  //Consulta no banco de dados
  // Future <List<Map<String, dynamic>>> query(String sql_query) async {
  //   Database db = await instance.database;

  //   //print(sql_query);
  //   //Os dados são alocado em nesse array 'result'
  //   List<Map> result = await db.rawQuery(sql_query);

  //   //Exibindo o resultado do select no console
  //   result.forEach((row) => print(row));

    //Verificar se retornou apenas uma linha...
  // }

  listarUsuarios() async{

    Database db = await this.database;
    String sql = "SELECT * FROM $tabelaUsuarios";

    List listausuarios = await db.rawQuery(sql);

    return listausuarios;
}

  //Consulta ao banco de dados para autenticação do usuário
  Future <dynamic> queryLoginAuth (String email, String senha) async{
    final db = await database;
    return await db.query(
      tabelaUsuarios,
      where: "$colunaEmail = ? AND $colunaSenha = ?",
      whereArgs: [email,senha],
    );
  }
}
