import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  void Function()? onPressed;
  String? texto;

  Resposta({super.key, this.texto, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(texto!),
      ),
    );
  }
}
