import 'package:trilhapp/models/tarefa.dart';

class TarefaRepository {
  List<Tarefa> _tarefas = [];

  Future<void> addTarefa(Tarefa tarefa) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tarefas.add(tarefa);
  }

  Future<void> alterar(String id, bool concluido) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tarefas
        .where(
          (tarefa) => tarefa.id == id,
        )
        .first
        .concluido = concluido;
  }

    Future<void> remover(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tarefas.remove(_tarefas.where((tarefa) => tarefa.id == id,).first);
  }

  Future<List<Tarefa>> listarTarefas() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _tarefas;
  }

  Future<List<Tarefa>> listarNaoConcluidas() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _tarefas.where((tarefa) => !tarefa.concluido).toList();
  }
}
