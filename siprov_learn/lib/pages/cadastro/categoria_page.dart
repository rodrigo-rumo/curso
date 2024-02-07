import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:siprov_core/constantes/tipo_beneficio.dart';
import 'package:siprov_learn/bloc/categoria/categoria_bloc.dart';
import 'package:siprov_learn/bloc/categoria/categoria_event.dart';
import 'package:siprov_learn/bloc/categoria/categoria_state.dart';
import 'package:siprov_learn/domain/categoria_entity.dart';
import 'package:siprov_learn/pages/menu/menu_principal.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriaPage extends StatefulWidget {
  const CategoriaPage({super.key});

  @override
  State<CategoriaPage> createState() => _CategoriaPageState();
}

class _CategoriaPageState extends State<CategoriaPage> {
  late double _alturaTela;
  late double _larguraTela;
  late double _alturaBox;
  late double _larguraBox;
  final double _espacamentoPadrao = 36;
  late double _larguraListagem;

  bool _assinatura = false;
  bool _a24h = false;
  bool _consorcio = false;
  bool _diversos = false;
  bool _protecaoVeicular = false;
  bool _saude = false;

  final CategoriaBloc _categoriaBloc = Modular.get<CategoriaBloc>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _mensagemTipoBeneficio = '';

  CategoriaEntity _categoriaEntity = CategoriaEntity();

  @override
  Widget build(BuildContext context) {
    _alturaTela = MediaQuery.of(context).size.height;
    _larguraTela = MediaQuery.of(context).size.width;

    _alturaBox = _alturaTela - 90 - (_espacamentoPadrao * 3) - 52;
    _larguraBox = _larguraTela - (_espacamentoPadrao * 2);

    _larguraListagem = (_larguraTela * 0.3 < 450 ? 450 : _larguraTela * 0.3);

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
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cadastro de Categoria',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: _espacamentoPadrao),
          _box(),
        ],
      ),
    );
  }

  Widget _box() {
    return BlocBuilder(
      bloc: _categoriaBloc,
      builder: ((context, state) {
        if (state is InicialCategoriaState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ErroCategoriaState) {
          return Center(
            child: Text(state.mensagem),
          );
        }

        if (state is EditadoCategoriaState) {
          _recuperarDados();
        }

        return _conteudo();
      }),
    );
  }

  _recuperarDados() {
    _categoriaEntity = _categoriaBloc.categoriaSelecionada;
    if (_categoriaEntity.tiposBeneficio != null) {
      _assinatura = _categoriaEntity.tiposBeneficio!.contains(TipoBeneficio.assinatura);
      _a24h = _categoriaEntity.tiposBeneficio!.contains(TipoBeneficio.a24H);
      _consorcio = _categoriaEntity.tiposBeneficio!.contains(TipoBeneficio.consorcio);
      _diversos = _categoriaEntity.tiposBeneficio!.contains(TipoBeneficio.diversos);
      _protecaoVeicular = _categoriaEntity.tiposBeneficio!.contains(TipoBeneficio.protecaoVeicular);
      _saude = _categoriaEntity.tiposBeneficio!.contains(TipoBeneficio.saude);
    }
  }

  Widget _conteudo() {
    return Card(
      child: SizedBox(
        height: _alturaBox,
        width: _larguraBox,
        child: Row(
          children: [
            _lateralEsquerda(),
            _formulario(),
          ],
        ),
      ),
    );
  }

  Widget _lateralEsquerda() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Theme.of(context).colorScheme.primary.withAlpha(50),
            width: 1,
          ),
        ),
      ),
      width: _larguraListagem,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(_espacamentoPadrao / 2),
                child: SizedBox(
                  height: 32,
                  width: _larguraListagem / 2,
                  child: TextFormField(
                    onChanged: (texto) {
                      _categoriaBloc.add(PesquisarCategoriaEvent(texto));
                    },
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.disabled,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          _listView(),
        ],
      ),
    );
  }

  Widget _listView() {
    bool progresso = false;

    if (_categoriaBloc.state is ListandoCategoriaState || _categoriaBloc.state is PesquisandoCategoriaState) {
      progresso = true;
    }

    List<CategoriaEntity> categorias = _categoriaBloc.categorias;
    if (progresso) {
      categorias = List.generate(5, (index) {
        return CategoriaEntity(
          nome: 'Categoria $index',
          ordemExibicao: index,
        );
      });
    }

    return Expanded(
      child: Skeletonizer(
        enabled: progresso,
        child: ListView.builder(
          itemCount: categorias.length,
          itemBuilder: (context, indice) {
            return ListTile(
              leading: CircleAvatar(
                child: Text('${indice + 1}'),
              ),
              trailing: InkWell(
                onTap: () {
                  _excluir(indice: indice);
                },
                child: const Icon(Icons.delete),
              ),
              title: InkWell(
                onTap: () {
                  _categoriaBloc.add(EditarCategoriaEvent(categorias[indice]));
                },
                child: Text('${categorias[indice].nome}'),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _formulario() {
    return Form(
      key: _formKey,
      child: Expanded(
        child: Padding(
          padding: EdgeInsets.all(_espacamentoPadrao),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          _limparDados();
                        },
                        child: const Text('Novo')),
                    const SizedBox(width: 8),
                    ElevatedButton(
                        onPressed: () {
                          _salvar();
                        },
                        child: const Text('Salvar')),
                  ],
                ),
              ),
              const Divider(),
              SizedBox(
                height: _espacamentoPadrao,
              ),
              ..._tipoBeneficio(),
              SizedBox(
                height: _espacamentoPadrao / 2,
              ),
              ..._nomeCategoria(),
              SizedBox(
                height: _espacamentoPadrao / 2,
              ),
              ..._ordemExibicao(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _tipoBeneficio() {
    return [
      Align(
        alignment: AlignmentDirectional.topStart,
        child: Text('Tipo de Benefício', style: Theme.of(context).textTheme.bodyLarge),
      ),
      const SizedBox(
        height: 8,
      ),
      Row(
        children: [
          Checkbox(
              value: _assinatura,
              onChanged: (value) {
                setState(() {
                  _assinatura = !_assinatura;
                });
              }),
          Text(TipoBeneficio.assinatura.nome, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
      Row(
        children: [
          Checkbox(
              value: _a24h,
              onChanged: (value) {
                setState(() {
                  _a24h = !_a24h;
                });
              }),
          Text(TipoBeneficio.a24H.nome, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
      Row(
        children: [
          Checkbox(
            value: _consorcio,
            onChanged: (value) {
              setState(() {
                _consorcio = !_consorcio;
              });
            },
          ),
          Text(TipoBeneficio.consorcio.nome, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
      Row(
        children: [
          Checkbox(
            value: _diversos,
            onChanged: (value) {
              setState(() {
                _diversos = !_diversos;
              });
            },
          ),
          Text(TipoBeneficio.diversos.nome, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
      Row(
        children: [
          Checkbox(
            value: _protecaoVeicular,
            onChanged: (value) {
              setState(() {
                _protecaoVeicular = !_protecaoVeicular;
              });
            },
          ),
          Text(TipoBeneficio.protecaoVeicular.nome, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
      Row(
        children: [
          Checkbox(
              value: _saude,
              onChanged: (value) {
                setState(() {
                  _saude = !_saude;
                });
              }),
          Text(TipoBeneficio.saude.nome, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
      Align(
        alignment: Alignment.topLeft,
        child: Visibility(
          visible: _mensagemTipoBeneficio.isNotEmpty,
          child: Text(_mensagemTipoBeneficio,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              )),
        ),
      ),
    ];
  }

  List<Widget> _nomeCategoria() {
    return [
      Align(
        alignment: AlignmentDirectional.topStart,
        child: Text('Nome', style: Theme.of(context).textTheme.bodyLarge),
      ),
      TextFormField(
        key: Key('key_nome_categoria${DateTime.now().millisecondsSinceEpoch}'),
        keyboardType: TextInputType.text,
        initialValue: _categoriaEntity.nome,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Informe um nome para categoria';
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onSaved: (newValue) {
          _categoriaEntity = _categoriaEntity.copyWith(
            nome: newValue,
          );
        },
      ),
    ];
  }

  List<Widget> _ordemExibicao() {
    return [
      Align(
        alignment: AlignmentDirectional.topStart,
        child: Text('Ordem de exibição', style: Theme.of(context).textTheme.bodyLarge),
      ),
      TextFormField(
        key: Key('key_ordem_exibicao${DateTime.now().millisecondsSinceEpoch}'),
        keyboardType: TextInputType.number,
        initialValue: '${_categoriaEntity.ordemExibicao}',
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Informe uma ordem de exibição';
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onSaved: (newValue) {
          _categoriaEntity = _categoriaEntity.copyWith(
            ordemExibicao: int.parse(newValue!),
          );
        },
      ),
    ];
  }

  void _salvar() async {
    if (_assinatura == false && _a24h == false && _consorcio == false && _diversos == false && _protecaoVeicular == false && _saude == false) {
      setState(() {
        _mensagemTipoBeneficio = 'Informe pelo menos um tipo de benefício';
      });
      return;
    } else {
      setState(() {
        _mensagemTipoBeneficio = '';
      });
    }

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      List<TipoBeneficio> tipos = [];

      if (_assinatura) {
        tipos.add(TipoBeneficio.assinatura);
      }
      if (_a24h) {
        tipos.add(TipoBeneficio.a24H);
      }
      if (_consorcio) {
        tipos.add(TipoBeneficio.consorcio);
      }
      if (_diversos) {
        tipos.add(TipoBeneficio.diversos);
      }
      if (_protecaoVeicular) {
        tipos.add(TipoBeneficio.protecaoVeicular);
      }
      if (_saude) {
        tipos.add(TipoBeneficio.saude);
      }

      _categoriaEntity = _categoriaEntity.copyWith(
        tiposBeneficio: tipos,
      );

      await _enviarDados();
      await _carregarCategorias();
    }
  }

  void _excluir({required int indice}) async {
    _categoriaBloc.add(ExcluirCategoriaEvent(_categoriaBloc.categorias[indice]));
  }

  _enviarDados() async {
    _categoriaBloc.add(GravarCategoriaEvent(_categoriaEntity));

    _limparDados();
  }

  _limparDados() {
    _a24h = false;
    _assinatura = false;
    _consorcio = false;
    _diversos = false;
    _protecaoVeicular = false;
    _saude = false;

    _categoriaEntity = CategoriaEntity(
      nome: '',
      ordemExibicao: _categoriaBloc.proximaOrdemExibicao,
    );

    _categoriaBloc.add(ListarCategoriasEvent());
  }

  @override
  initState() {
    _inicializarVariaveis();

    super.initState();
  }

  _inicializarVariaveis() {
    setState(() {
      _categoriaEntity = _categoriaEntity.copyWith(
        ordemExibicao: _categoriaBloc.proximaOrdemExibicao,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _carregarCategorias();
      _listen();
    });
  }

  _carregarCategorias() {
    _categoriaBloc.add(ListarCategoriasEvent());
  }

  _listen() {
    _categoriaBloc.stream.listen((state) {
      if (state is GravadoCategoriaState) {
        _carregarCategorias();
      }

      if (state is ExcluidoCategoriaState) {
        _carregarCategorias();
      }
    });
  }
}
