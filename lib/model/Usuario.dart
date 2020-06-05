
class Usuario{
  String _nome;
  String _email;
  String _senha;

  Usuario(String nome, String email, String senha){
    this._nome = nome;
    this._email = email;
    this._senha = senha;
  }

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }
}