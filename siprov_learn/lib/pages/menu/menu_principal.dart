import 'package:flutter/material.dart';

class MenuPrincipalDrawer extends StatefulWidget {
  const MenuPrincipalDrawer({super.key});

  @override
  State<MenuPrincipalDrawer> createState() => _MenuPrincipalDrawerState();
}

class _MenuPrincipalDrawerState extends State<MenuPrincipalDrawer> {
  final double _espacoPadrao = 16;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.all(_espacoPadrao),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const CircleAvatar(
              foregroundImage: AssetImage('assets/images/foto.jpeg'),
              radius: 60,
            ),
            SizedBox(
              height: _espacoPadrao,
            ),
            Text(
              "Leandro Silva",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
              height: _espacoPadrao,
            ),
            Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),            
            SizedBox(
              height: _espacoPadrao,
            ),
            Text(
              "INFORMAÇÕES DE ACESSO",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: _espacoPadrao,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "Usuário",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            SizedBox(
              height: _espacoPadrao * 3,
            ),
            Text(
              "CONTEÚDOS ESTUDADOS",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: _espacoPadrao,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "Meu Progresso",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            SizedBox(
              height: _espacoPadrao,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "Últimas visualizações",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            SizedBox(
              height: _espacoPadrao * 3,
            ),
            Text(
              "CADASTRO DE MATERIAIS",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: _espacoPadrao,
            ),
            InkWell(
              onTap: () {
                _goCategoria();
              },
              child: Text(
                "Cadastro de Categorias",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            SizedBox(
              height: _espacoPadrao,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cadastro de Fluxos",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            SizedBox(
              height: _espacoPadrao,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cadastro de Artigos",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            SizedBox(
              height: _espacoPadrao,
            ),
            InkWell(
              onTap: () {
                _goTag();
              },
              child: Text(
                "Cadastro de Tags",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            SizedBox(
              height: _espacoPadrao * 3,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "Sair",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _goCategoria() {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/siprov_learn/cadastro/categoria');
  }

  _goTag() {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/siprov_learn/cadastro/tag');
  }
}
