import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  @override
  final String texto;
  final void Function() onSelection;

  Resposta(this.texto, this.onSelection);

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onSelection,
        child: Text(texto),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue[300],
          textStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
