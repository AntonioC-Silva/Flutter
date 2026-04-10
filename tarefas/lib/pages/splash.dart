import 'package:flutter/material.dart';
import 'package:tarefas/navigation/NavBar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //logica
  @override
  void initState(){//instruções na estapa inicial de carregamento dela
    super.initState();
    Future.delayed( // esper 2 seg e faz algo
      Duration(seconds: 2),
      (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> NavBar()));
      }
    );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.task_outlined, size: 80, color: Colors.lightBlue,),
            Text("Taskredy", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.lightBlue),),
            Divider(indent: 50, endIndent: 50),
            Text("Bem vindo ao gerenciador de tarefas", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.lightBlue))
            
          ],
        )
      )
    );
  }
}