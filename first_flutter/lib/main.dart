import 'package:flutter/material.dart'; // components
import 'dart:io';

void main() {
  runApp(TelaHome());
}

class TelaHome extends StatelessWidget {
  const TelaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(//prove components para sua tela
    debugShowCheckedModeBanner: false,
      home: Scaffold(  //divide a tela em até três partes
      appBar: AppBar(
        title: Text("Tela home",
                    style: TextStyle(color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                    ),
        backgroundColor: Color.fromARGB(255, 59, 31, 161),
        
        
        ),
        body: Column(
          spacing: 30,
          children: [
            Container(margin: EdgeInsets.only(top: 20),
                      width: 350,
                      height: 150,
                      decoration: BoxDecoration( color: Color.fromARGB(255, 59, 31, 161), borderRadius: BorderRadius.circular(20)),
            ),
            Row(
              spacing: 30, //espaçamento
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 95,
                          height: 95,
                          decoration: BoxDecoration( color: Color.fromARGB(255, 59, 31, 161), borderRadius: BorderRadius.circular(20))),
                Container(width: 95,
                          height: 95,
                          decoration: BoxDecoration( color: Color.fromARGB(255, 59, 31, 161), borderRadius: BorderRadius.circular(20))),
                Container(width: 95,
                          height: 95,
                          decoration: BoxDecoration( color: Color.fromARGB(255, 59, 31, 161), borderRadius: BorderRadius.circular(20)))
              ],
            )
          
          ],
        ),

      ),
    ); 
  }
}



