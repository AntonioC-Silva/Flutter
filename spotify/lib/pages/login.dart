import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        backgroundColor: Color(0xff121212),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          spacing: 10,
          children: [
            Image.asset("assets/logo.png",height: 40,),
            Text("Spotify", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
            
            
          ],
        ),
      ),




      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Text("Entrar no Spotify", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold,)),

            SizedBox(height: 90,),
            SizedBox(
              width: 300,
              child: 
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelStyle: TextStyle(color:  Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  labelText: 'Usuário',
                  hintText: 'Digite seu usuário',
                  prefixIcon: Icon(Icons.person, color: Colors.white,),
                  focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff1db954)),
                  borderRadius: BorderRadius.circular(50),
                  )
                ),
              )
            ),

            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 300,
              child: 
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelStyle: TextStyle(color:  Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  labelText: 'Senha',
                  hintText: 'Digite sua senha',
                  prefixIcon: Icon(Icons.lock_person_outlined, color: Colors.white,),
                  focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff1db954)),
                  borderRadius: BorderRadius.circular(50),
                  )
                ),
              )
            ),

            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Não tem conta?", style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.normal),),
                GestureDetector(onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                }, child: Text("Cadastre-se", style: TextStyle(color: Color(0xff1db954)),),)


              ],
            ),

            SizedBox(height: 80,),
            TextButton(
              style: TextButton.styleFrom( 
              padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
              backgroundColor: Color(0xff1db954),
              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                }, child: Text("Entrar", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),), ),







          ],
        ),
      ),











    );
  }
}