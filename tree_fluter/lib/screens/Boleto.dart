import 'package:flutter/material.dart';

import 'dart:io';


class Boleto extends StatefulWidget {
  const Boleto({super.key});

  @override
  State<Boleto> createState() => _BoletoState();
}

class _BoletoState extends State<Boleto> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Boleto()

    );
  }
}