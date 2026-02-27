import 'package:flutter/material.dart';

import 'dart:io';

import 'package:tree_fluter/main.dart';


class Cartao extends StatefulWidget {
  const Cartao({super.key});

  @override
  State<Cartao> createState() => _CartaoState();
}

class _CartaoState extends State<Cartao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,), onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => TelaInicial()),);
        },),
        centerTitle: true,
        title: Text("CARTÃO", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.orange,),

        body: Center(
          child: Column(
            children: [
              SizedBox(height: 60),
              Text("Peça já o seu!",style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 20),),

              Container(
                margin: EdgeInsets.only(top: 50),
                width: 300,
                height: 500,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/page_c.png"), fit: BoxFit.cover), borderRadius: BorderRadius.circular(15)),
                
              ),

              SizedBox(height: 60),
              TextButton(
                style: TextButton.styleFrom( 
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                elevation: 10,
                shadowColor: Colors.black.withOpacity(1),
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Cartao()));
                  }, child: Text("Solicitar", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),), ),
 

            ],
          ),
        ),
      
     

    );
  }
}

