import 'package:dio/dio.dart';
import 'package:siprov_core/exceptions/generic_exception.dart';
import 'package:siprov_learn/constantes/siprov_learn_const.dart';
import 'package:siprov_learn/domain/tag_entity.dart';

class TagRepository {
  final Dio dio;

  TagRepository(this.dio);

  Future<void> gravar(TagEntity tagEntity) async {
    try {
      await dio.post(
        '$urlApi/tags',
        data: tagEntity.toJson(),
      );
    } on Exception catch (_) {
      throw Exception('Erro ao gravar tag');
    }
  }

  Future<List<TagEntity>> listar() async {
    try {
      final response = await dio.get('$urlApi/tags');

      List<TagEntity> retorno = [];

      List<dynamic> listaTags = response.data;
      for (Map<String, dynamic> map in listaTags) {
        retorno.add(TagEntity.fromJson(map));
      }

      return retorno;
    } on Exception catch (_) {
      throw GenericException('Erro de conexão com a API');
    }
  }

  Future<void> excluir({required TagEntity tagEntity}) async {
    try {
      await dio.delete(
        '$urlApi/tags/${tagEntity.idTag}',
      );
    } on Exception catch (_) {
      throw GenericException('Erro ao excluir tag');
    }
  }
}
