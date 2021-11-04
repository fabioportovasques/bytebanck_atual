import 'package:flutter/material.dart';
import 'package:path/path.dart';

class Progress extends StatelessWidget {
  final String message;

  Progress({this.message = 'Loading'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.only(top: 8.0), //only top deixa o espaco apenas no topo
            child: Text(message,style: TextStyle(fontSize: 16.0),),
          ),
        ],
      ),
    );
  }
}
