import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:perguntaapp/components/resposta.dart';

import '../components/questao.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  final perguntas = [
    {
      "texto": "Qual o seu animal favorito?",
      "resposta": ['Cão', 'Gato', 'Tartaruga', 'Coelho']
    },
    {
      "texto": "Qual a sua cor favorita?",
      "resposta": ['Azul', 'Verde', 'Vermelho', 'Roxo']
    },
    {
      "texto": "Qual o seu anime favorito",
      "resposta": ['AOT', 'Naruto', 'One Piece']
    }
  ];
  int _perguntaSelecionada = 0;
  void responder() {
    setState(() {
      if (_perguntaSelecionada + 1 < perguntas.length) {
        _perguntaSelecionada++;
      } 
      print(_perguntaSelecionada);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Resposta> respostas = [];
    for (String resposta
        in perguntas[_perguntaSelecionada].cast()['resposta']) {
      respostas.add(Resposta(texto: resposta, onPressed: responder));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Perguntas"),
      ),
      body: Column(
        children: [
          Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
          ...respostas,
        ],
      ),
    );
  }
}
