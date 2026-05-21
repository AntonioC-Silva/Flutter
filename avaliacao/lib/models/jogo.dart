import 'dart:convert';
import 'modelo_base.dart';

//definindo a classe jogo como modelo de dados de um jogo(json)
class Jogo extends ModeloBase {
  final int id;
  final String nome;
  final List<String> categorias;
  final double valor;
  final String imagem;

  //criando instancia principal com todos os campos obrigatorios
  Jogo({
    required this.id,
    required this.nome,
    required this.categorias,
    required this.valor,
    required this.imagem,
  });

  //função que cria jogo a partir do json e trata id 
  factory Jogo.fromJson(Map<String, dynamic> json) {
    final idValue = json['id'];

    return Jogo(
      id: int.tryParse(idValue.toString()) ?? 0,
      nome: json['nome'] as String,
      categorias: List<String>.from(json['categorias'] as List<dynamic>),
      valor: (json['valor'] as num).toDouble(),
      imagem: json['imagem'] as String,
    );
  }


  factory Jogo.fromMap(Map<String, dynamic> map) {
    final categoriasJson = map['categorias']?.toString() ?? '[]';
    final dynamic decoded = json.decode(categoriasJson);
    return Jogo(
      id: map['id'] is int
          ? map['id'] as int
          : int.tryParse(map['id']?.toString() ?? '0') ?? 0,
      nome: map['nome']?.toString() ?? '',
      categorias: List<String>.from(decoded as List<dynamic>),
      valor: map['valor'] is num
          ? (map['valor'] as num).toDouble()
          : double.tryParse(map['valor']?.toString() ?? '0') ?? 0,
      imagem: map['imagem']?.toString() ?? '',
    );
  }

  //converte instancia pra Map para armazenamento local
  @override
  Map<String, dynamic> toMap() => {
        'id': id,
        'nome': nome,
        'categorias': json.encode(categorias),
        'valor': valor,
        'imagem': imagem,
      };

  //função que converte instancia pra json 
  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'nome': nome,
        'categorias': categorias,
        'valor': valor,
        'imagem': imagem,
      };
}
