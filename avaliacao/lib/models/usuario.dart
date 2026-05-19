class Usuario {
  final String? id;
  final String nome;
  final String email;
  final String senha;
  final String avatar;

  Usuario({
    this.id,
    required this.nome,
    required this.email,
    required this.senha,
    required this.avatar,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id']?.toString() ?? '',
      nome: json['nome']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      senha: json['senha']?.toString() ?? '',
      avatar: json['avatar']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() =>
      {'nome': nome, 'email': email, 'senha': senha, 'avatar': avatar};
}