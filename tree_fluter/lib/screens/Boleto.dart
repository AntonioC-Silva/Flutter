import 'package:flutter/material.dart';

import 'dart:io';

import 'package:tree_fluter/main.dart';


class Boleto extends StatefulWidget {
  const Boleto({super.key});

  @override
  State<Boleto> createState() => _BoletoState();
}

class _BoletoState extends State<Boleto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,), onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => TelaInicial()),);
        },),
        centerTitle: true,
        title: Text("BOLETO", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.orange,),

        body: Center( child: Column(
          children: [

              SizedBox(height: 60),
              TextButton.icon(
                style: TextButton.styleFrom( 
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                elevation: 10,
                shadowColor: Colors.black.withOpacity(1),
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Boleto()));
                  },icon: Icon(Icons.cameraswitch_outlined, color: Colors.white, size: 20,), 
                  label: Text("Scanear Boleto", style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,),),),



          ],
        ),),






    );
  }
}