import 'package:flutter/material.dart';
import 'package:trilhapp/repositories/linguagens_repository.dart';
import 'package:trilhapp/repositories/nivel_repository.dart';
import 'package:trilhapp/shared/widgets/text_label.dart';

class DadosCadastrais extends StatefulWidget {
  const DadosCadastrais({super.key});

  @override
  State<DadosCadastrais> createState() => _DadosCadastraisState();
}

class _DadosCadastraisState extends State<DadosCadastrais> {
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  DateTime? dataNascimento;
  var nivelRepository = NivelRepository();
  var linguagensRepository = LinguagensRepository();
  var niveis = [];
  var linguagens = [];
  var linguagensSelecionada = [];
  var nivelSelecionado = '';
  double salarioEscolhido = 0;
  int tempoExperiencia = 0;

  bool salvando = false;

  @override
  void initState() {
    niveis = (nivelRepository.retornaNiveis());
    linguagens = (linguagensRepository.retornaLinguagnes());
    super.initState();
  }

  List<DropdownMenuItem<int>> returnItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= quantidadeMaxima; i++) {
      itens.add(DropdownMenuItem(
        value: i,
        child: Text(i.toString()),
      ));
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Dados'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: salvando
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  const TextLabel(texto: 'Nome'),
                  TextField(
                    controller: nomeController,
                  ),
                  const TextLabel(texto: 'Data nascimento'),
                  TextFormField(
                    readOnly: true,
                    controller: dataNascimentoController,
                    onTap: () async {
                      var data = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000, 1, 1),
                        firstDate: DateTime(1900, 5, 20),
                        lastDate: DateTime(2025, 10, 25),
                      );
                      if (data != null) {
                        dataNascimentoController.text = data.toString();
                        dataNascimento = data;
                      }
                    },
                  ),
                  const TextLabel(texto: 'Nivel de Experiencia'),
                  Column(
                      children: niveis
                          .map(
                            (nivel) => RadioListTile(
                              title: Text(nivel.toString()),
                              selected: nivelSelecionado == nivel,
                              value: nivel.toString(),
                              groupValue: nivelSelecionado,
                              onChanged: (value) {
                                setState(() {
                                  nivelSelecionado = value.toString();
                                });
                              },
                            ),
                          )
                          .toList()),
                  const TextLabel(texto: 'Linguagens preferidas'),
                  Column(
                    children: linguagens
                        .map(
                          (linguagem) => CheckboxListTile(
                              title: Text(linguagem),
                              selected: linguagensSelecionada == linguagem,
                              value: linguagensSelecionada.contains(linguagem),
                              onChanged: (bool? value) {
                                if (value!) {
                                  setState(() {
                                    linguagensSelecionada.add(linguagem);
                                  });
                                } else {
                                  setState(() {
                                    linguagensSelecionada.remove(linguagem);
                                  });
                                }
                              }),
                        )
                        .toList(),
                  ),
                  const TextLabel(texto: 'Tempo de experiencia'),
                  DropdownButton(
                    value: tempoExperiencia,
                    isExpanded: true,
                    items: returnItens(50),
                    onChanged: (value) {
                      setState(() {
                        tempoExperiencia = int.parse(value.toString());
                      });
                    },
                  ),
                  TextLabel(
                      texto:
                          'Pretenção salarial R\$ ${salarioEscolhido.round().toString()}'),
                  Slider(
                    min: 0,
                    max: 10000,
                    value: salarioEscolhido,
                    onChanged: (double value) {
                      setState(() {
                        salarioEscolhido = value;
                      });
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        salvando = false;
                      });
                      if (nomeController.text.trim().length < 3) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('O nome deve ser prenchido')));
                        return;
                      }
                      if (dataNascimento == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Data de nascimento invalida')));
                        return;
                      }
                      if (nivelSelecionado.trim() == '') {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('O nivel deve ser selecionado')));
                        return;
                      }
                      if (linguagensSelecionada.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'Deve ser selecionado ao menos uma linguagem')));
                        return;
                      }
                      if (tempoExperiencia == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Deve ter ao menos um ano de experiencia')));
                        return;
                      }
                      if (salarioEscolhido == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'A pretencção salarial deve maior que 0')));
                        return;
                      }

                      setState(() {
                        salvando = true;
                      });

                      Future.delayed(
                        const Duration(seconds: 3),
                        () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Dados salvos com sucesso')));
                          setState(() {
                            salvando = false;
                          });
                          Navigator.pop(context);
                        },
                      );
                    },
                    child: const Text('Salvar'),
                  ),
                ],
              ),
      ),
    );
  }
}
