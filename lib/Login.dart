import 'package:flutter/material.dart';
import 'package:whatsapp/Cadastro.dart';
import 'package:whatsapp/Home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  TextEditingController _controllerEmail;
  TextEditingController _controllerSenha;

  @override
  void initState() {
    // TODO: implement initState
    _controllerEmail = TextEditingController();
    _controllerSenha = TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
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
                        Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) =>Home()
                        ));
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
