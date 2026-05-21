import 'modelo_base.dart';

//define a classe usuario e representa os dados de um usuario(json)                                
class Usuario extends ModeloBase {
  final String? id;
  final String nome;
  final String email;
  final String senha;
  final String avatar;

  //função que cria instancia com id opcional e outros campos obrigatorios
  Usuario({
    this.id,
    required this.nome,
    required this.email,
    required this.senha,
    required this.avatar,
  });

  //cria usuario a partir do json e trata nulls convertendo pra string
  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id']?.toString() ?? '',
      nome: json['nome']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      senha: json['senha']?.toString() ?? '',
      avatar: json['avatar']?.toString() ?? '',
    );
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id']?.toString() ?? '',
      nome: map['nome']?.toString() ?? '',
      email: map['email']?.toString() ?? '',
      senha: map['senha']?.toString() ?? '',
      avatar: map['avatar']?.toString() ?? '',
    );
  }

  //função que converte o usuario pra json para envio
  @override
  Map<String, dynamic> toJson() =>
      {'nome': nome, 'email': email, 'senha': senha, 'avatar': avatar};

  //converte o usuario pra map para armazenamento local
  @override
  Map<String, dynamic> toMap() => {
        'id': id ?? '',
        'nome': nome,
        'email': email,
        'senha': senha,
        'avatar': avatar,
      };
}
