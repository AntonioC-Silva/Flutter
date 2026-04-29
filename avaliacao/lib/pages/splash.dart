import 'package:avaliacao/navigation/NavBar.dart';
import 'package:avaliacao/pages/home.dart';
import 'package:flutter/material.dart';


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
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
      }
    );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF040C20),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image:  AssetImage("assets/logo.png"), width: 150, height: 150,),
          ],
        )
      )
    );
  }
}