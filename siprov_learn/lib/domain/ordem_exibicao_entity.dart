import 'package:siprov_learn/domain/artigo_entity.dart';

class OrdemExibicaoEntity {
  final int idExibicao;

  final ArtigoEntity artigoEntity;
  final int ordemExibicao;

  OrdemExibicaoEntity({
    required this.idExibicao,
    required this.artigoEntity,
    required this.ordemExibicao,
  });  

  OrdemExibicaoEntity copyWith({
    int? idExibicao,
    ArtigoEntity? artigoEntity,
    int? ordemExibicao,
  }) {
    return OrdemExibicaoEntity(
      idExibicao: idExibicao ?? this.idExibicao,
      artigoEntity: artigoEntity ?? this.artigoEntity,
      ordemExibicao: ordemExibicao ?? this.ordemExibicao,
    );
  }
}
