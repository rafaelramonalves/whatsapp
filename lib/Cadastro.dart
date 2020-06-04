import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
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

                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
