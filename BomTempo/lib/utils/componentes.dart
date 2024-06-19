import 'package:flutter/material.dart';

class Componentes {
  static Widget rotulo(String rotulo) {
    return Text(
      rotulo,
      style: TextStyle(color: Colors.white70, fontSize: 18),
    );
  }

  static Widget temperatura(String temp) {
    return Text(
      temp,
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w400, fontSize: 130),
    );
  }

  static Widget resultado(String rotulo) {
    return Text(
      rotulo,
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w400, fontSize: 28),
    );
  }

  static Widget barraPesquisa(
      String dica, TextEditingController controlador, void Function()? clique) {
    return TextFormField(
      controller: controlador,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0XFFE0E0E0),
        hintText: dica,
        contentPadding: EdgeInsets.only(top: 10, left: 15),
        hintStyle: TextStyle(
          fontSize: 18,
          color: Color(0XFF898989),
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: clique,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
      ),
    );
  }
}