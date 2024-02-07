import 'package:siprov_core/constantes/tipo_beneficio.dart';
import 'package:siprov_learn/domain/fluxo_entity.dart';

class CategoriaEntity {
  final String? idCategoria;
  final String? nome;
  final int? ordemExibicao;
  final List<TipoBeneficio>? tiposBeneficio;
  final List<FluxoEntity>? fluxos;

  CategoriaEntity({
    this.idCategoria,
    this.nome,
    this.ordemExibicao,
    this.tiposBeneficio,
    this.fluxos,
  });

  CategoriaEntity copyWith({
    String? idCategoria,
    String? nome,
    int? ordemExibicao,
    List<TipoBeneficio>? tiposBeneficio,
    List<FluxoEntity>? fluxos,
  }) {
    return CategoriaEntity(
      idCategoria: idCategoria ?? this.idCategoria,
      nome: nome ?? this.nome,
      ordemExibicao: ordemExibicao ?? this.ordemExibicao,
      tiposBeneficio: tiposBeneficio ?? this.tiposBeneficio,
      fluxos: fluxos ?? this.fluxos,
    );
  }
  

  Map<String, dynamic> toJson(){
    List<String> tipos = [];
    for (TipoBeneficio tipo in tiposBeneficio!){
      tipos.add(tipo.tipo);
    }

    return {
      'nome': nome,
      'ordemExibicao': ordemExibicao,      
      'tiposBeneficio': tipos
    };
  }

  factory CategoriaEntity.fromJson(Map<String, dynamic> map){
    List<TipoBeneficio> tipos = [];
    for (String tipo in map['tiposBeneficio']){
      tipos.add(TipoBeneficio.fromTipo(tipo));
    }

    return CategoriaEntity(
      idCategoria: map['id'],
      nome: map['nome'],
      ordemExibicao: map['ordemExibicao'],
      tiposBeneficio: tipos,
    );
  }

}
