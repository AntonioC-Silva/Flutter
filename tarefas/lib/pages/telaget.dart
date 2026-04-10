import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class TelaGet extends StatefulWidget {
  const TelaGet({super.key});

  @override
  State<TelaGet> createState() => _TelaGetState();
}

class _TelaGetState extends State<TelaGet> {
  // logica
  String result = "";
  void GET() async{ //async pq espera o resultado da requisição
    final askProvider = await http.get(Uri.parse("http://10.109.72.10:3000/task")); //constante que espera receber o valor então ela muda quando receber a resposta do servidor
  
    if (askProvider.statusCode == 200){
      final data = jsonDecode(askProvider.body);

      setState(() {
        result = data[0]["title"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightBlue,
        
        title: Text("Taskredy", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),

      body: Center(
        child: Column(
          children: [
            Text(result),
            TextButton(onPressed: GET, child: Text("GET"), style: TextButton.styleFrom(backgroundColor: Colors.lightBlue, foregroundColor: Colors.white, padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10), shape: RoundedRectangleBorder( borderRadius: BorderRadiusGeometry.circular(20))),)

          ],
        ),
      ),
    );
  }
}