import 'package:calculadora/operador.dart';
import 'package:flutter/material.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  late Size tamanhoTela;
  late double alturaLinha;
  late double larguraCelula;
  late Color corFundo;

  String labelValor = '';

  List<String> valoresDigitados = [];
  late Operador operador;

  @override
  Widget build(BuildContext context) {
    tamanhoTela = MediaQuery.of(context).size;

    alturaLinha = (tamanhoTela.height - 1) / 8;
    larguraCelula = tamanhoTela.width / 4;
    corFundo = Colors.white;

    return corpo();
  }

  Widget corpo() {
    return Container(
      color: corFundo,
      child: Column(
        children: [
          SizedBox(
            height: alturaLinha * 3,
            width: tamanhoTela.width,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: valoresDigitados.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              valoresDigitados[index].toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        labelValor,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
            height: 1,
          ),
          criaLinha(
            altura: alturaLinha,
            filhos: [
              InkWell(
                onTap: () {
                  _limparTexto();
                },
                child: criaCelula(
                  texto: (labelValor.isNotEmpty || valoresDigitados.isNotEmpty) ? 'AC' : 'C',
                  corFundo: Colors.orange,
                  corTexto: Colors.white,
                ),
              ),
              criaCelula(
                texto: '()',
                corFundo: Colors.orange,
                corTexto: Colors.white,
              ),
              criaCelula(
                texto: '%',
                corFundo: Colors.orange,
                corTexto: Colors.white,
              ),
              InkWell(
                onTap: () {
                  _adicionarValor(op: Operador.divisao);
                },
                child: criaCelula(
                  texto: '/',
                  corFundo: Colors.orange,
                  corTexto: Colors.white,
                ),
              ),
            ],
          ),
          criaLinha(
            altura: alturaLinha,
            filhos: [
              InkWell(
                onTap: () {
                  _adicionaCaracter('7');
                },
                child: criaCelula(texto: '7'),
              ),
              InkWell(
                onTap: () {
                  _adicionaCaracter('8');
                },
                child: criaCelula(texto: '8'),
              ),
              InkWell(
                onTap: () {
                  _adicionaCaracter('9');
                },
                child: criaCelula(texto: '9'),
              ),
              InkWell(
                onTap: () {
                  _adicionarValor(op: Operador.multiplicacao);
                },
                child: criaCelula(
                  texto: '*',
                  corFundo: Colors.orange,
                  corTexto: Colors.white,
                ),
              ),
            ],
          ),
          criaLinha(
            altura: alturaLinha,
            filhos: [
              InkWell(
                onTap: () {
                  _adicionaCaracter('4');
                },
                child: criaCelula(texto: '4'),
              ),
              InkWell(
                child: criaCelula(texto: '5'),
                onTap: () {
                  _adicionaCaracter('5');
                },
              ),
              InkWell(
                child: criaCelula(texto: '6'),
                onTap: () {
                  _adicionaCaracter('6');
                },
              ),
              InkWell(
                onTap: () {
                  _adicionarValor(op: Operador.subtracao);
                },
                child: criaCelula(
                  texto: '-',
                  corFundo: Colors.orange,
                  corTexto: Colors.white,
                ),
              ),
            ],
          ),
          criaLinha(
            altura: alturaLinha,
            filhos: [
              InkWell(
                child: criaCelula(texto: '1'),
                onTap: () {
                  _adicionaCaracter('1');
                },
              ),
              InkWell(
                child: criaCelula(texto: '2'),
                onTap: () {
                  _adicionaCaracter('2');
                },
              ),
              InkWell(
                child: criaCelula(texto: '3'),
                onTap: () {
                  _adicionaCaracter('3');
                },
              ),
              InkWell(
                onTap: () {
                  _adicionarValor(op: Operador.soma);
                },
                child: criaCelula(
                  texto: '+',
                  corFundo: Colors.orange,
                  corTexto: Colors.white,
                ),
              ),
            ],
          ),
          criaLinha(altura: alturaLinha, filhos: [
            criaCelula(
              texto: '+/-',
              corFundo: Colors.orange,
              corTexto: Colors.white,
            ),
            InkWell(
              child: criaCelula(texto: '0'),
              onTap: () {
                _adicionaCaracter('0');
              },
            ),
            InkWell(
              onTap: () {
                _adicionaCaracter(',');
              },
              child: criaCelula(
                texto: ',',
                corFundo: Colors.orange,
                corTexto: Colors.white,
              ),
            ),
            InkWell(
              onTap: () {
                _adicionarValor(op: Operador.resultado);
              },
              child: criaCelula(
                texto: '=',
                corFundo: Colors.green,
                corTexto: Colors.white,
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Widget criaLinha({
    required double altura,
    required List<Widget> filhos,
  }) {
    Widget linha = SizedBox(
      height: alturaLinha,
      width: tamanhoTela.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: filhos,
      ),
    );

    return linha;
  }

  Widget criaCelula({
    required String texto,
    Color? corFundo,
    Color? corTexto,
  }) {
    Widget celula = Container(
      height: alturaLinha - 16,
      width: larguraCelula - 16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(alturaLinha / 2),
        color: corFundo ?? Colors.grey,
      ),
      child: Center(
        child: Text(
          texto,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            color: corTexto ?? Colors.black,
          ),
        ),
      ),
    );

    return celula;
  }

  _adicionaCaracter(String caracter) {
    if (caracter == '0' && labelValor == '0') {
      return;
    }

    if (caracter == ',' && labelValor.contains(',')) {
      return;
    }

    if (labelValor.length == 20) {
      return;
    }

    setState(() {
      labelValor = '$labelValor$caracter';

      if (labelValor.length == 2) {
        if (labelValor[0] == '0') {
          labelValor = caracter;
        }
      }
    });
  }

  _adicionarValor({required Operador op}) {
    if (labelValor.isEmpty && op == Operador.resultado) {
      return;
    }
    
    labelValor += labelOperador(op: op);
    valoresDigitados.add(labelValor);

    if (op != Operador.resultado) {
      operador = op;

      setState(() {
        labelValor = '';
      });
    }

    _calcularResultado();
  }

  _calcularResultado() {
    if (valoresDigitados.length != 2) {
      return;
    }

    String sValor1 = valoresDigitados[0].substring(0, valoresDigitados[0].length - 3);
    sValor1 = sValor1.replaceAll(',', '.');

    String sValor2 = valoresDigitados[1].substring(0, valoresDigitados[1].length - 3);
    sValor2 = sValor2.replaceAll(',', '.');

    final double valor1 = double.parse(sValor1);
    final double valor2 = double.parse(sValor2);

    late double resultado;

    switch (operador) {
      case Operador.soma:
        resultado = valor1 + valor2;
        break;
      case Operador.subtracao:
        resultado = valor1 - valor2;
        break;
      case Operador.divisao:
        resultado = valor1 / valor2;
        break;
      case Operador.multiplicacao:
        resultado = valor1 * valor2;
        break;
      default:
        break;
    }

    setState(() {
      valoresDigitados.clear();
      valoresDigitados.add('$resultado${labelOperador(op: operador)}');
      labelValor = '';
    });
  }

  _limparTexto() {
    setState(() {
      labelValor = '';
      valoresDigitados.clear();
    });
  }

  String labelOperador({required Operador op}) {
    switch (op) {
      case Operador.soma:
        return ' + ';
      case Operador.subtracao:
        return ' - ';      
      case Operador.divisao:
        return ' / ';
      case Operador.multiplicacao:
        return ' * ';
      default:
        return '   ';
    }
  }
}
