import 'dart:async';
import 'dart:io';
//
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
//
import 'package:crud/CadastroModel.dart';

class DatabaseHelper {
  static final _databaseName = "exemplo.db";
  static final _databaseVersion = 1;

  static final tabelaUsuarios = 'usuario';
  static final colunaId = '_id';
  static final colunaNome = 'nome';
  static final colunaTelefone = 'telefone';
  static final colunaEmail = 'email';
  static final colunaSenha = 'senha';

  // torna esta classe singleton
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
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

  //Autenticar o usuário
}
