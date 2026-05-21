// função que guarda dados locais em shared_preferences (usuario e favoritos)
import 'package:shared_preferences/shared_preferences.dart';
import 'package:avaliacao/models/usuario.dart';
import 'package:avaliacao/models/jogo.dart';
import 'dart:convert';

class LocalDatabase {
  // função que salva usuario
  static Future<void> salvarUsuario(Usuario usuario) async {
    final dados = await SharedPreferences.getInstance();
    final json = jsonEncode(usuario.toJson());
    await dados.setString('usuario', json);
  }

  // função que retorna o usuario salvo ou null
  static Future<Usuario?> obterUsuario() async {
    final dados = await SharedPreferences.getInstance();
    final json = dados.getString('usuario');

    if (json == null) {
      return null;
    }

    final map = jsonDecode(json);
    return Usuario.fromJson(map);
  }

  // remove o usuario salvo
  static Future<void> limparUsuario() async {
    final dados = await SharedPreferences.getInstance();
    await dados.remove('usuario');
  }

  // adiciona jogo aos favoritos evitando duplicatas
  static Future<void> salvarFavorito(Jogo jogo) async {
    final dados = await SharedPreferences.getInstance();
    final favoritos = await obterFavoritos();

    bool existe = false;
    for (var jg in favoritos) {
      if (jg.id == jogo.id) {
        existe = true;
        break;
      }
    }

    if (!existe) {
      favoritos.add(jogo);
      final json = jsonEncode(favoritos.map((j) => j.toJson()).toList());
      await dados.setString('favoritos', json);
    }
  }

  //remove favorito por id
  static Future<void> removerFavorito(int id) async {
    final dados = await SharedPreferences.getInstance();
    final favoritos = await obterFavoritos();

    favoritos.removeWhere((jogo) => jogo.id == id);
    final json = jsonEncode(favoritos.map((j) => j.toJson()).toList());
    await dados.setString('favoritos', json);
  }

  // fretorna lista de favoritos 
  static Future<List<Jogo>> obterFavoritos() async {
    final dados = await SharedPreferences.getInstance();
    final json = dados.getString('favoritos');

    if (json == null) {
      return [];
    }

    final lista = jsonDecode(json) as List;
    return lista.map((item) => Jogo.fromJson(item)).toList();
  }

  //verifica se id esta entre os favoritos
  static Future<bool> isFavorito(int id) async {
    final favoritos = await obterFavoritos();
    for (var jogo in favoritos) {
      if (jogo.id == id) {
        return true;
      }
    }
    return false;
  }
}
