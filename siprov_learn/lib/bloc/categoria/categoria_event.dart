import 'package:siprov_learn/domain/categoria_entity.dart';

sealed class CategoriaEvent{}

class ListarCategoriasEvent extends CategoriaEvent{}

class GravarCategoriaEvent extends CategoriaEvent{
  final CategoriaEntity categoria;
  GravarCategoriaEvent(this.categoria);
}

class ExcluirCategoriaEvent extends CategoriaEvent{
  final CategoriaEntity categoria;
  ExcluirCategoriaEvent(this.categoria);
}

class EditarCategoriaEvent extends CategoriaEvent{
  final CategoriaEntity categoria;
  EditarCategoriaEvent(this.categoria);
}

class PesquisarCategoriaEvent extends CategoriaEvent{
  final String textoPesquisado;
  PesquisarCategoriaEvent(this.textoPesquisado);
}

class LimparDadosCategoriaEvent extends CategoriaEvent{}