import 'package:siprov_core/constantes/tipo_beneficio.dart';
import 'package:siprov_learn/domain/ordem_exibicao_entity.dart';
import 'package:siprov_learn/domain/tag_entity.dart';

class ArtigoEntity {
  final int idArtigo;

  final String conteudo;
  final List<OrdemExibicaoEntity> exibicoes;
  final String imagem;
  final String resumo;
  final List<TagEntity>? tags;
  final String titulo;
  final List<TipoBeneficio> tiposBeneficio;

  ArtigoEntity({
    required this.idArtigo,
    required this.conteudo,
    required this.exibicoes,
    required this.imagem,
    required this.resumo,
    required this.tags,
    required this.titulo,
    required this.tiposBeneficio,
  });  

  ArtigoEntity copyWith({
    int? idArtigo,
    String? conteudo,
    List<OrdemExibicaoEntity>? exibicoes,
    String? imagem,
    String? resumo,
    List<TagEntity>? tags,
    String? titulo,
    List<TipoBeneficio>? tiposBeneficio,
  }) {
    return ArtigoEntity(
      idArtigo: idArtigo ?? this.idArtigo,
      conteudo: conteudo ?? this.conteudo,
      exibicoes: exibicoes ?? this.exibicoes,
      imagem: imagem ?? this.imagem,
      resumo: resumo ?? this.resumo,
      tags: tags ?? this.tags,
      titulo: titulo ?? this.titulo,
      tiposBeneficio: tiposBeneficio ?? this.tiposBeneficio,
    );
  }
}
