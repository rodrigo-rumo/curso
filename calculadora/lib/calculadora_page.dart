import 'package:flutter/material.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  @override
  Widget build(BuildContext context) {

    Size tamanhoTela = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          color: Colors.white,
          height: tamanhoTela.height * 0.2,
          width: tamanhoTela.width,
        ),
        Container(
          color: Colors.black,
          height: 2,
          width: tamanhoTela.width,
        ),
        Container(
          color: Colors.white,
          height: (tamanhoTela.height * 0.2) - 2,
          width: tamanhoTela.width,
          child: Row(
            children: [
              SizedBox(
                height: 100,
                width: tamanhoTela.width / 4,
                child: const Text('1', textAlign: TextAlign.center),
              ),
              SizedBox(
                height: 100,
                width: tamanhoTela.width / 4,
                child: const Text('2', textAlign: TextAlign.center),
              ),
              SizedBox(
                height: 100,
                width: tamanhoTela.width / 4,
                child: const Text('3', textAlign: TextAlign.center),
              ),
              SizedBox(
                height: 100,
                width: tamanhoTela.width / 4,
                child: const Text('-', textAlign: TextAlign.center),
              )
            ],
          ),
        ),
        Container(
          color: Colors.white,
          height: (tamanhoTela.height * 0.2) - 2,
          width: tamanhoTela.width,
          child: Row(
            children: [
              SizedBox(
                height: 100,
                width: tamanhoTela.width / 4,
                child: const Text('4', textAlign: TextAlign.center),
              ),
              SizedBox(
                height: 100,
                width: tamanhoTela.width / 4,
                child: const Text('5', textAlign: TextAlign.center),
              ),
              SizedBox(
                height: 100,
                width: tamanhoTela.width / 4,
                child: const Text('6', textAlign: TextAlign.center),
              ),
              SizedBox(
                height: 100,
                width: tamanhoTela.width / 4,
                child: const Text('+', textAlign: TextAlign.center),
              )
            ],
          ),
        ),
        Row(
          children: [
            Column(children: [
              Container(
                width: tamanhoTela.width * 0.75,
                color: Colors.green,
                height: (tamanhoTela.height * 0.2) - 2,
                child: Row(
                  children: [
                    SizedBox(
                      height: 100,
                      width: tamanhoTela.width / 4,
                      child: const Text('7', textAlign: TextAlign.center),
                    ),
                    SizedBox(
                      height: 100,
                      width: tamanhoTela.width / 4,
                      child: const Text('8', textAlign: TextAlign.center),
                    ),
                    SizedBox(
                      height: 100,
                      width: tamanhoTela.width / 4,
                      child: const Text('9', textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.green,
                height: tamanhoTela.height * 0.2 - 2,
                child: Row(
                  children: [
                    SizedBox(
                      height: 100,
                      width: tamanhoTela.width / 4,
                      child: const Text('/', textAlign: TextAlign.center),
                    ),
                    SizedBox(
                      height: 100,
                      width: tamanhoTela.width / 4,
                      child: const Text('0', textAlign: TextAlign.center),
                    ),
                    SizedBox(
                      height: 100,
                      width: tamanhoTela.width / 4,
                      child: const Text('*', textAlign: TextAlign.center),
                    ),
                  ],
                ),
              )
            ]),
            Container(
              width: tamanhoTela.width*0.25,
              height: tamanhoTela.height * 0.4 - 2,
              color: Colors.white,
              child: const Center(child: Text('=', textAlign: TextAlign.center,)),
            )
          ],
        ),
      ],
    );
  }
}
