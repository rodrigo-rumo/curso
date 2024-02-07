import 'dart:ui';
import 'package:siprov_core/constantes/tipo_beneficio.dart';
import 'package:siprov_learn/domain/ordem_exibicao_entity.dart';

class FluxoEntity {
  final int idFluxo;

  final String nome;
  final String descricao;
  final String icone;
  final Color corIcone;

  final List<OrdemExibicaoEntity> videos;
  final List<TipoBeneficio> tiposBeneficio;

  FluxoEntity({
    required this.idFluxo,
    required this.nome,
    required this.descricao,
    required this.icone,
    required this.corIcone,
    required this.videos,
    required this.tiposBeneficio,
  });

  FluxoEntity copyWith({
    int? idFluxo,
    String? nome,
    String? descricao,
    String? icone,
    Color? corIcone,
    List<OrdemExibicaoEntity>? videos,
    List<TipoBeneficio>? tiposBeneficio,
  }) {
    return FluxoEntity(
      idFluxo: idFluxo ?? this.idFluxo,
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
      icone: icone ?? this.icone,
      corIcone: corIcone ?? this.corIcone,
      videos: videos ?? this.videos,
      tiposBeneficio: tiposBeneficio ?? this.tiposBeneficio,
    );
  }
}
