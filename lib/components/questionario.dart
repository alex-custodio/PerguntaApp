import 'package:flutter/material.dart';
import 'package:perguntaapp/components/questao.dart';

class Questionario extends StatelessWidget {
  final String? textoQuestao;
  final List<Widget>? respostas;

  Questionario(this.textoQuestao, this.respostas);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Questao(textoQuestao!),
        ...respostas!,
      ],
    );
  }
}
