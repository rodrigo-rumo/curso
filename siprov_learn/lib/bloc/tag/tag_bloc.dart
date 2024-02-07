import 'package:bloc/bloc.dart';
import 'package:siprov_core/exceptions/generic_exception.dart';
import 'package:siprov_learn/bloc/tag/tag_event.dart';
import 'package:siprov_learn/bloc/tag/tag_state.dart';
import 'package:siprov_learn/domain/tag_entity.dart';
import 'package:siprov_learn/repositories/tag_repository.dart';

class TagBloc extends Bloc<TagEvent, TagState> {

  final TagRepository repository;

  List<TagEntity> _listaTag = [];
  List<TagEntity> get tags => _listaTag;

  int get proximaOrdemExibicao => _listaTag.length + 1;

  TagBloc(this.repository) : super(InicialTagState()) {
    on<ExcluirTagEvent>(_excluirTag);
    on<ListarTagEvent>(_listarTag);
    on<GravarTagEvent>(_gravarTag);
    on<PesquisarTagEvent>(_pesquisarTag);
  }

  _excluirTag(event, emit) async {
    emit(ExcluindoTagState());

    await repository.excluir(tagEntity: event.tag);
    await Future.delayed(const Duration(seconds: 2));

    emit(ExcluidoTagState());
    add(event = ListarTagEvent());
  }

  _listarTag(event, emit) async {
    emit(ListandoTagState());

    try {
      _listaTag = await repository.listar();

      emit(ListadoTagState(_listaTag));
    } on GenericException catch (e) {
      emit(ErroTagState(e.mensagem));
    }
  }

  _gravarTag(event, emit) async {
    emit(GravandoTagState());

    event = event as GravarTagEvent;
    await repository.gravar(event.tag);

    emit(GravadoTagState());
  }

  _pesquisarTag(event, emit) async {
    emit(PesquisandoTagState());

    List<TagEntity> tags = await repository.listar();

    _listaTag = [];
    for (TagEntity tag in tags) {
      if (tag.nome.toUpperCase().contains(event.textoPesquisado.toUpperCase())) {
        _listaTag.add(tag);
      }
    }
    await Future.delayed(const Duration(milliseconds: 250));

    emit(ListadoTagState(_listaTag));
  }
}
