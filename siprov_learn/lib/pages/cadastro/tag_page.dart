import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:siprov_learn/bloc/tag/tag_bloc.dart';
import 'package:siprov_learn/bloc/tag/tag_event.dart';
import 'package:siprov_learn/bloc/tag/tag_state.dart';
import 'package:siprov_learn/pages/menu/menu_principal.dart';

class TagPage extends StatefulWidget {
  const TagPage({super.key});

  @override
  State<TagPage> createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> {
  final TagBloc _tagBloc = Modular.get<TagBloc>();
  final double _espacamentoPadrao = 36;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      endDrawer: _drawer(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/logo_rumo.png',
            height: 60,
          ),
          Column(
            children: [
              const CircleAvatar(
                child: Text('A'),
              ),
              Text(
                'Isis Evelyn',
                style: Theme.of(context).textTheme.headlineSmall,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cadastro de Tag',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: _espacamentoPadrao),
          _box(),
        ],
      ),
    );
  }

  Widget _drawer() {
    return const MenuPrincipalDrawer();
  }

  Widget _box() {
    return BlocBuilder(
      bloc: _tagBloc,
      builder: ((context, state) {
        if (state is InicialTagState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ErroTagState) {
          return Center(
            child: Text(state.mensagem),
          );
        }

        return _conteudo();
      }),
    );
  }

  Widget _conteudo() {
    return Container(      
      width: 500,
      height: 500,
      color: Colors.amber,
    );
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _tagBloc.add(ListarTagEvent());
    });
  }
}
