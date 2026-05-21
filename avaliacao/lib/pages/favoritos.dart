import 'package:avaliacao/models/jogo.dart';
import 'package:avaliacao/services/local_database.dart';
import 'package:flutter/material.dart';

class FavoritosPage extends StatefulWidget {
  FavoritosPage({super.key});

  @override
  State<FavoritosPage> createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage> {
  List<Jogo> favoritos = [];
  bool carregando = true;

  @override
  void initState() {
    super.initState();
    carregarFavoritos();
  }

  void carregarFavoritos() async {
    final lista = await LocalDatabase.obterFavoritos();
    if (mounted) {
      setState(() {
        favoritos = lista;
        carregando = false;
      });
    }
  }

  void remover(int id) async {
    await LocalDatabase.removerFavorito(id);
    carregarFavoritos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF040C20),
      appBar: AppBar(
        title: Text('Meus Favoritos', style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFF040C20),
        elevation: 0,
      ),
      body: carregando
          ? Center(
              child: CircularProgressIndicator(color: Colors.greenAccent),
            )
          : favoritos.isEmpty
              ? Center(
                  child: Text(
                    'Nenhum favorito',
                    style: TextStyle(color: Colors.white70),
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: favoritos.length,
                  itemBuilder: (context, index) {
                    final jogo = favoritos[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Color(0xFF101820),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: SizedBox(
                          width: 50,
                          child: Image.network(
                            jogo.imagem,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          jogo.nome,
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          'R\$ ${jogo.valor.toStringAsFixed(2)}',
                          style: TextStyle(color: Colors.greenAccent),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => remover(jogo.id),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
