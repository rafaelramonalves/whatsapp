import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/model/Usuario.dart';

import 'Home.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  //Controladores
  TextEditingController _editingControllerNome = TextEditingController();
  TextEditingController _editingControllerEmail = TextEditingController();
  TextEditingController _editingControllerSenha = TextEditingController();

  String _mensagemErro = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Color(0xff075d54)
        ),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, //ocupar todo o espaço
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset("imagens/usuario.png",width: 200,height: 150,),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    key: Key("key-nome-cadastro"),
                    controller: _editingControllerNome,
                    autofocus: true, //O cursor ja entra diretamente nessa caixa de texto
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "nome",
                        filled: true, //preencher (por padrão vem false)
                        fillColor: Colors.white,
                        border: OutlineInputBorder( //Borda externa
                            borderRadius: BorderRadius.circular(32)
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    key: Key("key-email-cadastro"),
                    controller: _editingControllerEmail,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "E-mail",
                        filled: true, //preencher (por padrão vem false)
                        fillColor: Colors.white,
                        border: OutlineInputBorder( //Borda externa
                            borderRadius: BorderRadius.circular(32)
                        )
                    ),
                  ),
                ),
                TextField(
                  key: Key("key-senha-cadastro"),
                  controller: _editingControllerSenha,
                  obscureText: true, //ocultar senha
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Senha",
                      filled: true, //preencher (por padrão vem false)
                      fillColor: Colors.white,
                      border: OutlineInputBorder( //Borda externa
                          borderRadius: BorderRadius.circular(32)
                      )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:16, bottom: 10),
                  child: RaisedButton(
                    child: Text(
                      "cadastrar",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      ),
                    ),
                    color: Colors.green,
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    shape: RoundedRectangleBorder( //Arrendodar botão
                        borderRadius: BorderRadius.circular(32)
                    ),
                    onPressed: (){
                      //Validar os campos antes de salvar
                      validarCamposCadastro();
                    },
                  ),
                ),
                Center(
                  child: Text(
                    _mensagemErro,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validarCamposCadastro() {
    String nome =_editingControllerNome.text;
    String email =_editingControllerEmail.text;
    String senha =_editingControllerSenha.text;
    if(nome.isNotEmpty){
      if(email.isNotEmpty && email.contains("@")){

        if(senha.isNotEmpty && senha.length>6){ //por padrão as senhas tem que ser maior que 6
          setState(() {
            _mensagemErro ="";
            cadastrarUsuario(Usuario(nome,email,senha));
          });

        }else{
          setState(() {
            _mensagemErro="Preencha a senha, usando mais de 6 caracteres";
          });
        }
      }else{
        setState(() {
          _mensagemErro="Preencha o E-mail corretamente";
        });
      }
    }else{
      setState(() {
        _mensagemErro = "Preencha o nome";
      });
    }
  }

  void cadastrarUsuario(Usuario usuario) {

    //instancia autenticação firebase
    FirebaseAuth auth = FirebaseAuth.instance;

    //Cadastrar usando email e senha
    auth.createUserWithEmailAndPassword(
        email: usuario.email,
        password: usuario.senha
    ).then((fireBaseUser) {

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>Home()
          ));
      
    }).catchError((onError){//Tratamento de erro

      print("Erro app ${onError.toString()}");
    });

  }
}
