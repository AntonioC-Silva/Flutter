import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class TelaPost extends StatefulWidget {
  const TelaPost({super.key});

  @override
  State<TelaPost> createState() => _TelaPostState();
}

class _TelaPostState extends State<TelaPost> {
  TextEditingController valorDigitado = TextEditingController(); //variavel que observa o q o user digita

  void fazerPost() async{
    final askProvider = await http.post(Uri.parse("http://10.109.72.35:3000/task"), 
    headers: {"Content-Type": "application/json"}, //estou enviando um json para o POST
    body: jsonEncode({
      "title": valorDigitado.text // o novo registro da api vai receber title o valor digitado
    })
    );
    if (askProvider.statusCode == 201 || askProvider.statusCode == 200){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Dado enviado com sucesso"))
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela Post")),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            TextField(
              controller: valorDigitado,
              decoration: InputDecoration(
                labelText: 'Sua tarefa',
                hintText: 'Digite aqui...',   
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
              
            ),
            TextButton(onPressed: fazerPost, child: Text("Adicionar Dado"), style: TextButton.styleFrom(backgroundColor: Colors.lightBlue, foregroundColor: Colors.white, padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10), shape: RoundedRectangleBorder( borderRadius: BorderRadiusGeometry.circular(20))),)
          ],
        ),
      ),
    );
  }
}