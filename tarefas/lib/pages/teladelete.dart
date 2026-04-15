import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaDelete extends StatefulWidget {
  const TelaDelete({super.key});

  @override
  State<TelaDelete> createState() => _TelaDeleteState();
}

class _TelaDeleteState extends State<TelaDelete> {
  List listaApi = [];
  @override
  void initState(){ //rodar uma function ao abrir uma tela 
    super.initState(); //garante q vai funcionar
    fazerGet();
  }

  void fazerGet() async{
    final askProvider = await http.get(Uri.parse("http://10.109.72.35:3000/task"));
    if (askProvider.statusCode == 200){
      final data = jsonDecode(askProvider.body);
      setState(() {
        listaApi = data;
      });
    }
  }

  void fazerDelete(final id) async{
    final askProvider = await http.delete(Uri.parse("http://10.109.72.35:3000/task/$id"));
    if (askProvider.statusCode == 200){
      fazerGet(); //atualizo minha tela

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Dados deletados")));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela Delete")),
      body: ListView(//rolagem da tela
      children: [
        for(final item in listaApi)
        Card(
          child: ListTile(
            leading: Text(item["title"]),
            trailing: GestureDetector(
              onTap: () => fazerDelete(item["id"]),
              child: Icon(Icons.delete),
            ),
          ),
        ),
        Text("Você chegou ao final")
      ],

      ),
    );
  }
}