import 'package:siprov_learn/domain/categoria_entity.dart';

sealed class CategoriaState{}

class InicialCategoriaState extends CategoriaState{}

class ListandoCategoriaState extends CategoriaState{}

class ListadoCategoriaState extends CategoriaState{
  final List<CategoriaEntity> categorias;
  ListadoCategoriaState(this.categorias);
}

class PesquisandoCategoriaState extends CategoriaState{}

class ExcluindoCategoriaState extends CategoriaState{}

class ExcluidoCategoriaState extends CategoriaState{}

class EditandoCategoriaState extends CategoriaState{}

class EditadoCategoriaState extends CategoriaState{}

class GravandoCategoriaState extends CategoriaState{}

class GravadoCategoriaState extends CategoriaState{}

class LimpoCategoriaState extends CategoriaState{}

class ErroCategoriaState extends CategoriaState{
  final String mensagem;
  ErroCategoriaState(this.mensagem);
}
