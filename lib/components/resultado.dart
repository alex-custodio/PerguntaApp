import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  void Function()? onPressed;
  String? fraseFinal;
  Resultado({this.onPressed, this.fraseFinal});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseFinal!,
            style: TextStyle(fontSize: 28),
          ),
        ),
        ElevatedButton(onPressed: onPressed, child: const Text("Reiniciar?"))
      ],
    );
  }
}
