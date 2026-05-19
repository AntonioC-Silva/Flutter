class Jogo {
  final int id;
  final String nome;
  final List<String> categorias;
  final double valor;
  final String imagem;

  Jogo({
    required this.id,
    required this.nome,
    required this.categorias,
    required this.valor,
    required this.imagem,
  });

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
}
