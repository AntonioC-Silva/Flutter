import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> listaDeImagens = [
    'assets/play1.jpg',
    'assets/play2.jpg',
    'assets/play3.jpg',
    'assets/play4.jpg',
    'assets/play5.jpg',
  ];
  List<String> listaDePlay = [
    "Alternativas",
    "Treino Pesado",
    "Chill Hits",
    "Classicas",
    "Romanticas"
    ];

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
            Image.asset("assets/logo.png", height: 40),
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

      body: Column(
        spacing: 20,
        children: [
          SizedBox(height: 20),
          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Recentes",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
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
                          image: AssetImage("assets/Recentes1.png"),
                          fit: BoxFit.contain,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    const Text(
                      "Daily Mix 1",
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
                          image: AssetImage("assets/Recentes2.png"),
                          fit: BoxFit.contain,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    const Text(
                      "Rio Movie Songs",
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
                          image: AssetImage("assets/Recentes3.png"),
                          fit: BoxFit.contain,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    const Text(
                      "Rádio Major RD",
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
                          image: AssetImage("assets/Recentes4.png"),
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
                          image: AssetImage("assets/Recentes5.png"),
                          fit: BoxFit.contain,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    const Text(
                      "DS 17/18",
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
                          image: AssetImage("assets/Recentes6.png"),
                          fit: BoxFit.contain,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    const Text(
                      "Pagodinho",
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

          SizedBox(height: 20),
          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Playlists",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),

          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: SizedBox(
            height: 200, 
            width: 250,

            child: PageView.builder(
              padEnds: false,
              clipBehavior: Clip.none,
              itemCount: listaDeImagens.length,
              controller: PageController(viewportFraction: 0.8),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            listaDeImagens[index],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      Text(
                        listaDePlay[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          ),

        ],
      ),
    );
  }
}
