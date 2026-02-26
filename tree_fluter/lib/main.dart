import 'package:flutter/material.dart';
import 'package:tree_fluter/screens/Boleto.dart';
import 'package:tree_fluter/screens/Cartao.dart';
import 'dart:io';

import 'package:tree_fluter/screens/Pix.dart';

void main() {

  // é chamada de myapp
  runApp(Banco());
}

class Banco extends StatefulWidget {
  const Banco({super.key});

  @override
  State<Banco> createState() => _BancoState();
}

class _BancoState extends State<Banco> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaInicial()

    );
  }
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("INTER", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,),),
          backgroundColor: Colors.orange,
          
        ),
        
        body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                width: 350,
                height: 200,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/cartao.png"), fit: BoxFit.cover), borderRadius: BorderRadius.circular(10),),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text("Saldo:", style: TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),),

                


                  Container(
                    child: Row(
                    spacing: 90,
                    children: [
                    Text("R\$: 1800.00", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
                    TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Pix()));}, child: const Icon(Icons.remove_red_eye, color: Colors.black,)),

                    ],),
                    

                    margin: EdgeInsets.only(top:5),
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsetsGeometry.all(10),
                    width: 315,
                  ),
                  ]

              ),


            
              Padding(padding: EdgeInsetsGeometry.only(top:20), 
                child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 40,
      
                      children: [
                        TextButton(
                          style: TextButton.styleFrom( 
                          elevation: 10,
                          shadowColor: Colors.black.withOpacity(1),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                          side: BorderSide(
                          width: 25,
                          color: Colors.white
                        )),
                          onPressed: (){ //navegar para outra pagina

                          Navigator.push(context, MaterialPageRoute(builder: (context) => Pix()));
                        }, child: const Icon(Icons.pix, color: Colors.black, size: 37,),),

                        TextButton(
                          style: TextButton.styleFrom( 
                          elevation: 10,
                          shadowColor: Colors.black.withOpacity(1),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                          side: BorderSide(
                          width: 25,
                          color: Colors.white
                        )),
                          onPressed: (){

                          Navigator.push(context, MaterialPageRoute(builder: (context) => Boleto()));
                        }, child: const Icon(Icons.qr_code_outlined, color: Colors.black, size: 37,)),

                        TextButton(
                        style: TextButton.styleFrom( 
                          elevation: 10,
                          shadowColor: Colors.black.withOpacity(1),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                          side: BorderSide(
                          width: 25,
                          color: Colors.white
                        )),
                        onPressed: (){

                          Navigator.push(context, MaterialPageRoute(builder: (context) => Cartao()));
                        }, child: const Icon(Icons.credit_card_rounded, color: Colors.black, size: 37,), ),
                      ],
                  ),)

            ],
          ),
        ),
      );
  }

  





}