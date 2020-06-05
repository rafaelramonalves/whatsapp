import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/Cadastro.dart';
import 'package:whatsapp/Home.dart';

import 'model/Usuario.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  //Controladores
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _mensagemErro = "";

  @override
  void initState() {

    // Verificar se o usuario já está logado
    verificaUsusarioLogado();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Container(
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
                    child: Image.asset("imagens/logo.png",width: 200,height: 150,),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: TextField(
                      controller: _controllerEmail,
                      key: Key("email-field"),
                      autofocus: true, //O cursor ja entra diretamente nessa caixa de texto
                      keyboardType: TextInputType.emailAddress,
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
                    obscureText: true,
                    key: Key("senha-field"),
                    controller: _controllerSenha,
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
                        "Entrar",
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
                        validarCamposLogin();
                      },
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      child: Text(
                        "Não tem conta? Cadastre-se",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder:(context) => Cadastro()
                            )
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:16),
                    child: Center(
                      child: Text(
                        _mensagemErro,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }

  void validarCamposLogin() {
    String email =_controllerEmail.text;
    String senha =_controllerSenha.text;
    if(email.isNotEmpty && email.contains("@")){

      if(senha.isNotEmpty ){
        setState(() {
          _mensagemErro ="";
          Usuario usuario;
          usuario.email = email;
          usuario.senha = senha;
          logarUsuario(usuario);
        });

      }else{
        setState(() {
          _mensagemErro="Preencha a senha";
        });
      }
    }else{
      setState(() {
        _mensagemErro="Preencha o E-mail corretamente";
      });
    }
  }

  void logarUsuario(Usuario usuario) {
    
    //instância do firebase
    FirebaseAuth auth = FirebaseAuth.instance;
    //Logar com e-mail e senha
    auth.createUserWithEmailAndPassword(
        email: usuario.email,
        password: usuario.senha
    ).then((firebasUser){ //Caso de sucesso

      Navigator.push(
          context,
          MaterialPageRoute(
              builder:(context) => Home()
          )
      );

    }).catchError((error){ //Caso de erro

      _mensagemErro = "Erro ao autenticar usuario, verifique o email e senha";
    });
  }

  //Verfificar se o usuario já esta logado no firebase
  Future verificaUsusarioLogado() async{

    //pegar instancia do usuario
    FirebaseAuth auth = FirebaseAuth.instance;

    //Pegar o ususario que está logado no firebase
    FirebaseUser usuarioLogado = await auth.currentUser();

    //Se o ususario está logado, então ja vai para a tela principal do app
    if(usuarioLogado !=null){
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home()
          )
      );
    }
  }
}
