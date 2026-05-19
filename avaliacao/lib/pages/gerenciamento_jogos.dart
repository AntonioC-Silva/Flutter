import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:avaliacao/models/jogo.dart';
import 'package:avaliacao/components/gerenciamento_item_card.dart';

class TelaGerenciamentoJogos extends StatefulWidget {
  const TelaGerenciamentoJogos({super.key});

  @override
  State<TelaGerenciamentoJogos> createState() => _TelaGerenciamentoJogosState();
}

class _TelaGerenciamentoJogosState extends State<TelaGerenciamentoJogos> {
  // usa o ip do mesmo ambiente
  final String urlBase = 'http://172.24.96.1:3000'; 
  
  final _nomeController = TextEditingController();
  final _imagemController = TextEditingController();
  final _valorController = TextEditingController();
  final _categoriasController = TextEditingController();

  List<Jogo> _jogos = [];
  bool _carregando = false;
  String? _idEmEdicao; 

  @override
  void initState() {
    super.initState();
    _buscarJogos();
  }

  Future<void> _buscarJogos() async {
    setState(() => _carregando = true);
    try {
      final response = await http.get(Uri.parse('$urlBase/jogos'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _jogos = data.map((item) => Jogo.fromJson(item as Map<String, dynamic>)).toList();
        });
      }
    } catch (e) {
      debugPrint('Erro ao buscar jogos: $e');
    } finally {
      setState(() => _carregando = false);
    }
  }

  Future<void> _salvarJogo() async {
    final nome = _nomeController.text.trim();
    final imagem = _imagemController.text.trim();
    final valorStr = _valorController.text.trim();
    final categorias = _categoriasController.text.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();

    if (nome.isEmpty || imagem.isEmpty || valorStr.isEmpty) {
      _mostrarMensagem('Preencha os campos obrigatórios!', Colors.orangeAccent);
      return;
    }

    final double valor = double.tryParse(valorStr) ?? 0.0;
    final body = json.encode({
      'nome': nome,
      'imagem': imagem,
      'valor': valor,
      'categorias': categorias,
    });

    try {
      http.Response response;
      if (_idEmEdicao == null) {
        // post adiciona jogo
        response = await http.post(
          Uri.parse('$urlBase/jogos'),
          headers: {'Content-Type': 'application/json'},
          body: body,
        );
      } else {
        // put atualiza jogo
        response = await http.put(
          Uri.parse('$urlBase/jogos/$_idEmEdicao'),
          headers: {'Content-Type': 'application/json'},
          body: body,
        );
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        _mostrarMensagem(_idEmEdicao == null ? 'Jogo adicionado!' : 'Jogo atualizado!', Colors.green);
        _limparCampos();
        _buscarJogos();
      }
    } catch (e) {
      _mostrarMensagem('Erro na conexão', Colors.redAccent);
    }
  }

  Future<void> _deletarJogo(dynamic id) async {
    try {
      final response = await http.delete(Uri.parse('$urlBase/jogos/$id'));
      if (response.statusCode == 200) {
        _mostrarMensagem('Jogo excluído com sucesso', Colors.redAccent);
        _buscarJogos();
      }
    } catch (e) {
      debugPrint('Erro ao deletar: $e');
    }
  }

  void _prepararEdicao(Jogo jogo) {
    setState(() {
      // id do jogo deve estar visivel no model
      _idEmEdicao = jogo.id.toString(); 
      _nomeController.text = jogo.nome;
      _imagemController.text = jogo.imagem;
      _valorController.text = jogo.valor.toString();
      _categoriasController.text = jogo.categorias.join(', ');
    });
  }

  void _limparCampos() {
    setState(() {
      _idEmEdicao = null;
      _nomeController.clear();
      _imagemController.clear();
      _valorController.clear();
      _categoriasController.clear();
    });
  }

  void _mostrarMensagem(String msg, Color cor) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg), backgroundColor: cor));
  }

  Widget _construirCampoTexto(TextEditingController controller, String label, {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: const Color(0xFF1A2436),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white10),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF040C20),
      appBar: AppBar(
        title: const Text('Gerenciar Jogos', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          // Formulário de Cadastro/Edição
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF0F172A),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  _construirCampoTexto(_nomeController, 'Nome do Jogo'),
                  _construirCampoTexto(_imagemController, 'URL da Imagem'),
                  Row(
                    children: [
                      Expanded(child: _construirCampoTexto(_valorController, 'Valor', isNumber: true)),
                      const SizedBox(width: 10),
                      Expanded(child: _construirCampoTexto(_categoriasController, 'Categorias (Ação, RPG...)')),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _salvarJogo,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text(_idEmEdicao == null ? "ADICIONAR NOVO JOGO" : "SALVAR ALTERAÇÕES", 
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  if (_idEmEdicao != null)
                    TextButton(onPressed: _limparCampos, child: const Text('Cancelar Edição', style: TextStyle(color: Colors.white70))),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(alignment: Alignment.centerLeft, child: Text("Jogos Cadastrados", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))),
          ),
          const SizedBox(height: 10),
          // Lista de Jogos
          Expanded(
            child: _carregando 
              ? const Center(child: CircularProgressIndicator(color: Colors.greenAccent))
              : ListView.builder(
                  itemCount: _jogos.length,
                  itemBuilder: (context, index) {
                    return GerenciamentoItemCard(
                      jogo: _jogos[index],
                      aoEditar: () => _prepararEdicao(_jogos[index]),
                      aoDeletar: () => _deletarJogo(_jogos[index].id),
                    );
                  },
                ),
          ),
        ],
      ),
    );
  }
}