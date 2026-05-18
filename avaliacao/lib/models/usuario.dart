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
      id: json['id']?.toString(),
      nome: json['nome'] as String,
      email: json['email'] as String,
      senha: json['senha'] as String,
      avatar: json['avatar'] as String,
    );
  }

  Map<String, dynamic> toJson() =>
      {'nome': nome, 'email': email, 'senha': senha, 'avatar': avatar};
}