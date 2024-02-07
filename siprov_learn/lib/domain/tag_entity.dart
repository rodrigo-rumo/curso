import 'package:siprov_core/constantes/tipo_beneficio.dart';

class TagEntity {
  final int idTag;
  final String nome;
  final List<TipoBeneficio> tiposBeneficio;

  TagEntity({
    required this.idTag,
    required this.nome,
    required this.tiposBeneficio,
  });

  TagEntity copyWith({
    int? idTag,
    String? nome,
    List<TipoBeneficio>? tiposBeneficio,
  }) {
    return TagEntity(
      idTag: idTag ?? this.idTag,
      nome: nome ?? this.nome,
      tiposBeneficio: tiposBeneficio ?? this.tiposBeneficio,
    );
  }

  Map<String, dynamic> toJson(){
    List<String> tipos = [];
    for (TipoBeneficio tipo in tiposBeneficio){
      tipos.add(tipo.tipo);
    }

    return {
      'idTag': idTag,
      'nome': nome,
      'tiposBeneficio': tipos,
    };
  }

  factory TagEntity.fromJson(Map<String, dynamic> map){
    List<TipoBeneficio> tipos = [];
    for (String tipo in map['tiposBeneficio']){
      tipos.add(TipoBeneficio.fromTipo(tipo));
    }

    return TagEntity(
      idTag: map['idTag'],
      nome: map['nome'],
      tiposBeneficio: tipos,
    );
  }
}
