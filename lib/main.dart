import 'package:desafio_dio_cep/view/home_page.dart';
import 'package:desafio_dio_cep/view/lista_cep.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (_) => HomePage(),
        "/lista_cep": (_) => ListaCEPPage()
      },
    )
  );
}