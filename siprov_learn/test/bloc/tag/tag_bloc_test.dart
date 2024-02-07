import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:siprov_core/constantes/tipo_beneficio.dart';
import 'package:siprov_core/exceptions/generic_exception.dart';
import 'package:siprov_learn/bloc/tag/tag_bloc.dart';
import 'package:siprov_learn/bloc/tag/tag_event.dart';
import 'package:siprov_learn/bloc/tag/tag_state.dart';
import 'package:siprov_learn/domain/tag_entity.dart';
import 'package:siprov_learn/repositories/tag_repository.dart';

class TagRepositoryMock extends Mock implements TagRepository {}

void main() {
  late TagRepository repository;

  setUp(() {
    repository = TagRepositoryMock();
  });

  group('Listagem |', () {
    blocTest(
      'Deve listar as tags',
      setUp: () {
        when(() => repository.listar()).thenAnswer((_) async => [
              tagEntityMock1,
              tagEntityMock2,
            ]);
      },
      build: () => TagBloc(repository),
      act: (bloc) => bloc.add(ListarTagEvent()),
      expect: () => [
        isA<ListandoTagState>(),
        isA<ListadoTagState>(),
      ],
      verify: (bloc) {
        expect(bloc.tags.length, 2);
      },
    );

    blocTest(
      'Não deve encontrar tags',
      setUp: () {
        when(() => repository.listar()).thenAnswer((_) async => []);
      },
      build: () => TagBloc(repository),
      act: (bloc) => bloc.add(ListarTagEvent()),
      expect: () => [
        isA<ListandoTagState>(),
        isA<ListadoTagState>(),
      ],
      verify: (bloc) {
        expect(bloc.tags.length, 0);
      },
    );

    blocTest(
      'Não deve encontrar tags',
      setUp: () {
        when(() => repository.listar()).thenThrow(GenericException('Deu ruim!!'));
      },
      build: () => TagBloc(repository),
      act: (bloc) => bloc.add(ListarTagEvent()),
      expect: () => [
        isA<ListandoTagState>(),
        isA<ErroTagState>(),
      ],
    );
  });

  group('Gravação |', () {
    blocTest(
      'Deve gravar uma tag',
      setUp: () {
        when(() => repository.gravar(tagEntityMock1)).thenAnswer((_) async {});
      },
      build: () => TagBloc(repository),
      act: (bloc) => bloc.add(GravarTagEvent(tagEntityMock1)),
      expect: () => [          
        isA<GravandoTagState>(),
        isA<GravadoTagState>(),
      ],
    );
  });
}

final tagEntityMock1 = TagEntity(
  idTag: 1,
  nome: 'Tag 1',
  tiposBeneficio: [TipoBeneficio.a24H],
);

final tagEntityMock2 = TagEntity(
  idTag: 2,
  nome: 'Tag 2',
  tiposBeneficio: [TipoBeneficio.protecaoVeicular],
);
