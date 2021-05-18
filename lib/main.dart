import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() {
  runApp(new PerguntarApp());
}

class _PerguntaAppState extends State<PerguntarApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': [
        {'texto': 'Cor 1', 'pontuacao': 10},
        {'texto': 'Cor 2', 'pontuacao': 5},
        {'texto': 'Cor 3', 'pontuacao': 3},
        {'texto': 'Cor 4', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Animal 1', 'pontuacao': 10},
        {'texto': 'Animal 2', 'pontuacao': 5},
        {'texto': 'Animal 3', 'pontuacao': 3},
        {'texto': 'Animal 4', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual o seu instrutor?',
      'respostas': [
        {'texto': 'Instrutor 1', 'pontuacao': 10},
        {'texto': 'Instrutor 2', 'pontuacao': 5},
        {'texto': 'Instrutor 3', 'pontuacao': 3},
        {'texto': 'Instrutor 4', 'pontuacao': 1},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    // print(_perguntaSelecionada);
    // print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntarApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
