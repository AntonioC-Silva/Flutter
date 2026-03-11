import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      appBar: AppBar(
        backgroundColor: const Color(0xff121212),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          spacing: 10,
          children: [
            Image.asset(
              "assets/logo.png",
              height: 40,
            ),
            const Text(
              "Spotify",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 200),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/user.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          spacing: 20,
          children: [
            Text("Recentes", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),

            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 37, 37, 37),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Row(
                    spacing: 10,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/user.jpg"),
                            fit: BoxFit.contain,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      const Text(
                        "Uma Rapariga",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 37, 37, 37),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Row(
                    spacing: 10,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/user.jpg"),
                            fit: BoxFit.contain,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      const Text(
                        "Uma Rapariga",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 37, 37, 37),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Row(
                    spacing: 10,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/user.jpg"),
                            fit: BoxFit.contain,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      const Text(
                        "Uma Rapariga",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 37, 37, 37),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Row(
                    spacing: 10,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/user.jpg"),
                            fit: BoxFit.contain,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      const Text(
                        "Uma Rapariga",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
                        Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 37, 37, 37),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Row(
                    spacing: 10,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/user.jpg"),
                            fit: BoxFit.contain,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      const Text(
                        "Uma Rapariga",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 37, 37, 37),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Row(
                    spacing: 10,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/user.jpg"),
                            fit: BoxFit.contain,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      const Text(
                        "Uma Rapariga",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}