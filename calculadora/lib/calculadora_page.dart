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

  @override
  Widget build(BuildContext context) {
    tamanhoTela = MediaQuery.of(context).size;

    alturaLinha = (tamanhoTela.height - 1) / 8;
    larguraCelula = tamanhoTela.width / 4;
    corFundo = Colors.white;

    return corpo();
  }

  Widget corpo() {
    return Column(
      children: [
        Container(
          color: corFundo,
          height: alturaLinha * 3,
          width: tamanhoTela.width,
        ),
        const Divider(
          color: Colors.black,
          height: 1,
        ),
        criaLinha(
          altura: alturaLinha,
          filhos: [
            criaCelula(
              largura: larguraCelula,
              texto: 'AC',
            ),
            criaCelula(
              largura: larguraCelula,
              texto: '()',
            ),
            criaCelula(
              largura: larguraCelula,
              texto: '%',
            ),
            criaCelula(
              largura: larguraCelula,
              texto: '/',
            ),
          ],
        ),
        criaLinha(
          altura: alturaLinha,
          filhos: [
            criaCelula(
              largura: larguraCelula,
              texto: '7',
            ),
            criaCelula(
              largura: larguraCelula,
              texto: '8',
            ),
            criaCelula(
              largura: larguraCelula,
              texto: '9',
            ),
            criaCelula(
              largura: larguraCelula,
              texto: '*',
            ),
          ],
        ),
        criaLinha(
          altura: alturaLinha,
          filhos: [
            criaCelula(
              largura: larguraCelula,
              texto: '4',
            ),
            criaCelula(
              largura: larguraCelula,
              texto: '5',
            ),
            criaCelula(
              largura: larguraCelula,
              texto: '6',
            ),
            criaCelula(
              largura: larguraCelula,
              texto: '-',
            ),
          ],
        ),
        criaLinha(
          altura: alturaLinha,
          filhos: [
            criaCelula(
              largura: larguraCelula,
              texto: '1',
            ),
            criaCelula(
              largura: larguraCelula,
              texto: '2',
            ),
            criaCelula(
              largura: larguraCelula,
              texto: '3',
            ),
            criaCelula(
              largura: larguraCelula,
              texto: '+',
            ),
          ],
        ),
        criaLinha(altura: alturaLinha, filhos: [
          criaCelula(
            largura: larguraCelula,
            texto: '+/-',
          ),
          criaCelula(
            largura: larguraCelula,
            texto: '0',
          ),
          criaCelula(
            largura: larguraCelula,
            texto: ',',
          ),
          criaCelula(
            largura: larguraCelula,
            texto: '=',
          ),
        ]),
      ],
    );
  }

  Widget criaLinha({
    required double altura,
    required List<Widget> filhos,
  }) {
    Widget linha = Container(
      color: corFundo,
      height: alturaLinha,
      width: tamanhoTela.width,
      child: Row(
        children: filhos,
      ),
    );

    return linha;
  }

  Widget criaCelula({
    double? altura,
    required double largura,
    required String texto,
  }) {
    Widget celula = SizedBox(      
      height: altura,
      width: largura,
      child: Text(
        texto,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 30),
      ),
    );

    return celula;
  }
}
