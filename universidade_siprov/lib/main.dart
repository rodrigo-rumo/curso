import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:siprov_learn/module/siprov_learn_module.dart';
import 'package:universidade_siprov/app_widget.dart';

void main(){
  runApp(ModularApp(
    module: SiprovLearnModule(),
    child: const AppWidget(),
  ));
}
