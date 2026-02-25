import 'package:flutter/material.dart';

import 'dart:io';


class Pix extends StatefulWidget {
  const Pix({super.key});

  @override
  State<Pix> createState() => _PixState();
}

class _PixState extends State<Pix> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
         appBar: AppBar(
          
          title: Text("INTER", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,),),
          backgroundColor: Colors.orange,
        ),
      )
    );
  }
}