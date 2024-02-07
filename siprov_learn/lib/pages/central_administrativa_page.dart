import 'package:flutter/material.dart';
import 'package:siprov_learn/pages/menu/menu_principal.dart';

class CentralAdministrativaPage extends StatefulWidget {
  const CentralAdministrativaPage({super.key});

  @override
  State<CentralAdministrativaPage> createState() => _CentralAdministrativaPageState();
}

class _CentralAdministrativaPageState extends State<CentralAdministrativaPage> {
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

  Widget _drawer() {
    return const MenuPrincipalDrawer();
  }

  Widget _body() {
    return const Center(
      child: Text(''),
    );
  }
}
