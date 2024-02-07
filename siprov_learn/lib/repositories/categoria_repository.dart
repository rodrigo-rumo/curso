import 'package:dio/dio.dart';
import 'package:siprov_core/exceptions/generic_exception.dart';
import 'package:siprov_learn/constantes/siprov_learn_const.dart';
import 'package:siprov_learn/domain/categoria_entity.dart';

class CategoriaRepository {
  final Dio dio;

  CategoriaRepository(this.dio);

  Future<void> gravar(CategoriaEntity categoriaEntity) async {
    try {
      final response = await dio.post(
        '$urlApi/categorias',
        data: categoriaEntity.toJson(),
      );

      if (response.statusCode != 200) {
        throw Exception('Erro ao gravar categoria');
      }
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<List<CategoriaEntity>> listar() async {
    try {
      final response = await dio.get('$urlApi/categorias');

      if (response.statusCode != 200) {
        throw GenericException('Erro ao listar categorias');
      }

      List<CategoriaEntity> retorno = [];

      List<dynamic> listaCategorias = response.data;
      for (Map<String, dynamic> map in listaCategorias) {
        retorno.add(CategoriaEntity.fromJson(map));
      }

      return retorno;
    } on DioException catch (_) {
      throw GenericException('Erro de conexão com a API');
    }
  }

  Future<void> excluir({required CategoriaEntity categoriaEntity}) async {
    final response = await dio.delete(
      '$urlApi/categorias/${categoriaEntity.idCategoria}',
    );

    if (response.statusCode != 200) {
      throw Exception('Erro ao excluir categoria');
    }
  }
}
