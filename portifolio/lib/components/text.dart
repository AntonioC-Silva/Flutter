import 'package:flutter/material.dart';

class Texto extends StatelessWidget {
  final String texto;
  Texto({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 40),
      child: Text(texto, textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal ),  ),
    );
  }
}