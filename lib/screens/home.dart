import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:perguntaapp/components/Questionario.dart';
import 'package:perguntaapp/components/resposta.dart';
import 'package:perguntaapp/components/resultado.dart';

import '../components/questao.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  final perguntas = [
    {
      "texto": "Qual o seu animal favorito?",
      "resposta": [
        {"texto": "Cão", "nota": 10},
        {"texto": "Gato", "nota": 9},
        {"texto": "Tartaruga", "nota": 8},
        {"texto": "Coelho", "nota": 7},
      ]
    },
    {
      "texto": "Qual a sua cor favorita?",
      "resposta": [
        {"texto": "Azul", "nota": 10},
        {"texto": "Verde", "nota": 9},
        {"texto": "Vermelho", "nota": 8},
        {"texto": "Roxo", "nota": 7},
      ]
    },
    {
      "texto": "Qual o seu anime favorito",
      "resposta": [
        {"texto": "AOT", "nota": 10},
        {"texto": "Naruto", "nota": 9},
        {"texto": "One Piece", "nota": 8},
      ]
    }
  ];
  int _pontuacaoTotal = 0;
  int _perguntaSelecionada = 0;
  void responder(int pontuacao) {
    setState(() {
      if (temPerguntaSelecionada) {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      }

      print(_pontuacaoTotal);
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Resposta> respostas = [];
    String textoPergunta = "";
    if (temPerguntaSelecionada) {
      for (var resposta in perguntas[_perguntaSelecionada].cast()['resposta']) {
        respostas.add(Resposta(
            texto: resposta['texto'],
            onPressed: () {
              responder(resposta['nota']);
            }));
      }
      textoPergunta = perguntas[_perguntaSelecionada]['texto'].toString();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Questionario(textoPergunta, respostas)
            : Resultado());
  }
}
