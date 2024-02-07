import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:siprov_learn/bloc/categoria/categoria_bloc.dart';
import 'package:siprov_learn/bloc/tag/tag_bloc.dart';
import 'package:siprov_learn/pages/cadastro/categoria_page.dart';
import 'package:siprov_learn/pages/central_administrativa_page.dart';
import 'package:siprov_learn/repositories/categoria_repository.dart';
import 'package:siprov_learn/pages/cadastro/tag_page.dart';
import 'package:siprov_learn/repositories/tag_repository.dart';

class SiprovLearnModule extends Module{

  @override
  void binds(i) {
    i.addInstance(Dio());

    i.add(CategoriaRepository.new);
    i.add(TagRepository.new);

    //Blocs
    i.addSingleton(CategoriaBloc.new);
    i.addSingleton(TagBloc.new);
  }

  @override
  void routes(RouteManager r) {    
    super.routes(r);
    r.child('/siprov_learn', child: (context) => const CentralAdministrativaPage(),);
    r.child('/siprov_learn/cadastro/categoria', child: (context) => const CategoriaPage());
    r.child('/siprov_learn/cadastro/tag', child: (context) => const TagPage());
  }

}