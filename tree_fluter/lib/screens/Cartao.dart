import 'package:flutter/material.dart';

import 'dart:io';


class Cartao extends StatefulWidget {
  const Cartao({super.key});

  @override
  State<Cartao> createState() => _CartaoState();
}

class _CartaoState extends State<Cartao> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cartao()

    );
  }
}