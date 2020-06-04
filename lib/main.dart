import 'package:flutter/material.dart';
import 'package:whatsapp/Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp/Login.dart';

void main() {

  /*

  ///Na nova versão do flutter antes de instanciar o firebase tem que colocar
  WidgetsFlutterBinding.ensureInitialized();

  //Criar uma instância do firebase
  Firestore.instance
  .collection("usuarios")
  .document("001")
  .setData({"nome" : "Rafael"});

  */
  
  runApp(MaterialApp(
    home: Login(),
    //Cor padrão do App
    theme: ThemeData(
      //Cor primária (que vai ser dominante)
      primaryColor: Color(0xff075e54),

       accentColor: Color(0xff25D366)
    ),
  ));
}


