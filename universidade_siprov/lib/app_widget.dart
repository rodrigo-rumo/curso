import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:siprov_learn/shared/themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {

    Modular.setInitialRoute('/siprov_learn');

    return MaterialApp.router(
      title: 'Univerdade Siprov',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
