import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingPersonagem extends StatefulWidget {
  const LoadingPersonagem() : super();

  @override
  State<LoadingPersonagem> createState() => _LoadingPersonagemState();
}

class _LoadingPersonagemState extends State<LoadingPersonagem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          margin: const EdgeInsets.all(80),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                CircularProgressIndicator(),
                Text(
                  'Carregando Heroes ',
                  style: TextStyle(
                      color: Color(0xFF0505059),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
