import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Authentcate'),
      content: TextField(
        obscureText: true, //esconde a informação
        maxLength: 4, //limitar os caracteres
        decoration: InputDecoration(
          border: OutlineInputBorder()
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle( fontSize:  64, letterSpacing: 32), //aumentar  texto
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            print('concel');
          },
          child: Text('Cancel'),
        ),  FlatButton(
          onPressed: () {
            print('confirm');
          },
          child: Text('Confim'),
        )
      ], //aray de widget
    );
  }
}
