import 'package:bloc/bloc.dart';
import 'package:siprov_core/exceptions/generic_exception.dart';
import 'package:siprov_learn/bloc/categoria/categoria_event.dart';
import 'package:siprov_learn/bloc/categoria/categoria_state.dart';
import 'package:siprov_learn/domain/categoria_entity.dart';
import 'package:siprov_learn/repositories/categoria_repository.dart';

class CategoriaBloc extends Bloc<CategoriaEvent, CategoriaState> {

  final CategoriaRepository repository;

  List<CategoriaEntity> _listaCategorias = [];
  List<CategoriaEntity> get categorias => _listaCategorias;

  late CategoriaEntity _categoriaSelecionada;
  CategoriaEntity get categoriaSelecionada => _categoriaSelecionada;

  int get proximaOrdemExibicao => _listaCategorias.length + 1;

  CategoriaBloc(this.repository) : super(InicialCategoriaState()) {
    on<ExcluirCategoriaEvent>(_excluirCategoria);
    on<EditarCategoriaEvent>(_editarCategoria);
    on<ListarCategoriasEvent>(_listarCategorias);
    on<LimparDadosCategoriaEvent>(_limparDados);
    on<GravarCategoriaEvent>(_gravarCategoria);
    on<PesquisarCategoriaEvent>(_pesquisarCategoria);
  }

  _editarCategoria(event, emit) async{
    emit(EditandoCategoriaState());

    _categoriaSelecionada = event.categoria;

    emit(EditadoCategoriaState());
  }

  _excluirCategoria(event, emit) async {
    emit(ExcluindoCategoriaState());

    await repository.excluir(categoriaEntity: event.categoria);

    emit(ExcluidoCategoriaState());
  }

  _limparDados(event, emit){
    _categoriaSelecionada = CategoriaEntity();
    emit(LimpoCategoriaState());
  }

  _listarCategorias(event, emit) async {
    emit(ListandoCategoriaState());

    try {
      _listaCategorias = await repository.listar();

      emit(ListadoCategoriaState(_listaCategorias));
    } on GenericException catch (e) {
      emit(ErroCategoriaState(e.mensagem));
    }
  }

  _gravarCategoria(event, emit) async {
    emit(GravandoCategoriaState());

    await repository.gravar(event.categoria);

    emit(GravadoCategoriaState());
  }

  _pesquisarCategoria(event, emit) async {
    emit(PesquisandoCategoriaState());

    List<CategoriaEntity> categorias = await repository.listar();

    _listaCategorias = [];
    for (CategoriaEntity categoria in categorias) {
      if (categoria.nome!.toUpperCase().contains(event.textoPesquisado.toUpperCase())) {
        _listaCategorias.add(categoria);
      }
    }
    await Future.delayed(const Duration(milliseconds: 250));

    emit(ListadoCategoriaState(_listaCategorias));
  }
}
