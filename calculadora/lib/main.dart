import 'package:calculadora/calculadora_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: CalculadoraPage(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
