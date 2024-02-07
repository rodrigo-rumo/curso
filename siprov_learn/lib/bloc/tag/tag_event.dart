import 'package:siprov_learn/domain/tag_entity.dart';

sealed class TagEvent{}

class ListarTagEvent extends TagEvent{}

class GravarTagEvent extends TagEvent{
  final TagEntity tag;
  GravarTagEvent(this.tag);
}

class ExcluirTagEvent extends TagEvent{
  final TagEntity tag;
  ExcluirTagEvent(this.tag);
}

class EditarTagEvent extends TagEvent{
  final TagEntity tag;
  EditarTagEvent(this.tag);
}

class PesquisarTagEvent extends TagEvent{
  final String textoPesquisado;
  PesquisarTagEvent(this.textoPesquisado);
}