import 'package:siprov_learn/domain/tag_entity.dart';

sealed class TagState{}

class InicialTagState extends TagState{}

class ListandoTagState extends TagState{}

class ListadoTagState extends TagState{
  final List<TagEntity> tags;
  ListadoTagState(this.tags);
}

class PesquisandoTagState extends TagState{}

class ExcluindoTagState extends TagState{}

class ExcluidoTagState extends TagState{}

class EditandoTagState extends TagState{}

class EditadoTagState extends TagState{}

class GravandoTagState extends TagState{}

class GravadoTagState extends TagState{}

class ErroTagState extends TagState{
  final String mensagem;
  ErroTagState(this.mensagem);
}