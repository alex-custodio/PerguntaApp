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
      if (temPerguntaSelecionada) {
        _perguntaSelecionada++;
      }

      print(_perguntaSelecionada);
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
      for (String resposta
        in perguntas[_perguntaSelecionada].cast()['resposta']) {
      respostas.add(Resposta(texto: resposta, onPressed: responder));
      }
      textoPergunta = perguntas[_perguntaSelecionada]['texto'].toString();
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Perguntas"),
      ),
      body: temPerguntaSelecionada? Questionario(textoPergunta, respostas) : Resultado()
    );
  }
}
