import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:siprov_core/constantes/tipo_beneficio.dart';
import 'package:siprov_learn/constantes/siprov_learn_const.dart';
import 'package:siprov_learn/domain/tag_entity.dart';
import 'package:siprov_learn/repositories/tag_repository.dart';

void main() {
  late Dio dio;
  late TagRepository tagRepository;

  setUpAll(() {
    dio = Dio();
    tagRepository = TagRepository(dio);
  });

  group('Gravação |', () {
    test('Deve gravar uma tag', () {
      final DioAdapter dioAdapter = DioAdapter(dio: dio);
      dioAdapter.onPost(
        '$urlApi/tags',
        (server) {
          server.reply(
            200,
            {},
          );
        },
        data: tagEntityMock.toJson(),
      );

      final gravar = tagRepository.gravar(tagEntityMock);

      expect(gravar, completes);
    });

    test('Deve retornar um erro', () {
      final DioAdapter dioAdapter = DioAdapter(dio: dio);

      dioAdapter.onPost('$urlApi/tags', (server) {
        server.reply(500, {});
      });

      final gravar = tagRepository.gravar(tagEntityMock);

      expect(gravar, throwsException);
    });
  });

  group('Listagem | ', () {
    test('Deve listar duas tags', () {
      DioAdapter dioAdapter = DioAdapter(dio: dio);
      dioAdapter.onGet('$urlApi/tags', (server) {
        server.reply(
          200,
          listaTags,
        );
      });

      final listar = tagRepository.listar();

      expect(listar, completion(isA<List<TagEntity>>()));
      expect(listar, completion(hasLength(2)));
    });

    test('Deve retornar vazio', () {
      DioAdapter dioAdapter = DioAdapter(dio: dio);
      dioAdapter.onGet('$urlApi/tags', (server) {
        server.reply(
          200,
          [],
        );
      });

      final listar = tagRepository.listar();

      expect(listar, completion(isA<List<TagEntity>>()));
      expect(listar, completion(hasLength(0)));
    });

    test('Deve retornar um erro de conexão', () {
      DioAdapter dioAdapter = DioAdapter(dio: dio);
      dioAdapter.onGet('$urlApi/tags', (server) {
        server.reply(
          500,
          {},
        );
      });

      final listar = tagRepository.listar();

      expect(listar, throwsException);
    });
  });

  group('Excluir | ', () {
    test('Deve excluir uma tag', () {
      final DioAdapter dioAdapter = DioAdapter(dio: dio);
      dioAdapter.onDelete(
        '$urlApi/tags/${tagEntityMock.idTag}',
        (server) {
          server.reply(
            200,
            {},
          );
        },
      );

      final excluir = tagRepository.excluir(tagEntity: tagEntityMock);

      expect(excluir, completes);
    });

    test('Deve retornar um erro', () {
      final DioAdapter dioAdapter = DioAdapter(dio: dio);

      dioAdapter.onDelete('$urlApi/tags/${tagEntityMock.idTag}', (server) {
        server.reply(
          500,
          {},
        );
      });

      final excluir = tagRepository.excluir(tagEntity: tagEntityMock);

      expect(excluir, throwsException);
    });
  });
}

final tagEntityMock = TagEntity(
  idTag: 1,
  nome: 'Tag 1',
  tiposBeneficio: [
    TipoBeneficio.protecaoVeicular,
    TipoBeneficio.diversos,
  ],
);

final listaTags = [
  {
    "idTag": 1,
    "nome": "Tag 1",
    "tiposBeneficio": ["VEICULAR", "DIVERSOS"],
    "id": "f90cf020-c470-11ee-93f9-3b0fd059cd30"
  },
  {
    "idTag": 2,
    "nome": "Tag 2",
    "tiposBeneficio": ["VEICULAR", "A24H"],
    "id": "0f5f8c60-c472-11ee-93f9-3b0fd059cd30"
  },
];
