class Usuario {
  String nome;
  String email;
  String telefone;
  String senha;

  Usuario(
    this.nome,
    this.email,
    this.telefone,
    this.senha,
  );

  //Passando para objetos
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'senha': senha,
    };
    return map;
  }

  //Requer o pacote path_provider

  Usuario.fromMap(Map<String, dynamic> map) {
    nome = map['nome'];
    email = map['email'];
    telefone = map['telefone'];
    senha = map['senha'];
  }
}
