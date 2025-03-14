import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String texto;
  const TextLabel({required this.texto, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        texto,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }
}