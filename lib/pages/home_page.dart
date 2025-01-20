import 'package:flutter/material.dart';
import 'package:trilhapp/pages/dados_cadastrais.dart';
import 'package:trilhapp/pages/pagina_1.dart';
import 'package:trilhapp/pages/pagina_2.dart';
import 'package:trilhapp/pages/pagina_3.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController(initialPage: 0);
  int possicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Meu App"),
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DadosCadastrais(),
                      ),
                    );
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: const Text("Dados Cadastrais")),
                ),
                const Divider(),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: const Text("Termos de uso e privacidade"),
                  ),
                ),
                const Divider(),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: const Text("Configurações"),
                  ),
                )
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    possicaoPagina = value;
                  });
                },
                scrollDirection: Axis.horizontal,
                children: const [
                  Pagina1Page(),
                  Pagina2Page(),
                  Pagina3Page(),
                ],
              ),
            ),
            BottomNavigationBar(
              onTap: (value) {
                controller.jumpToPage(value);
              },
              currentIndex: possicaoPagina,
              items: const [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(
                    Icons.home,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Search",
                  icon: Icon(
                    Icons.search,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Favorite",
                  icon: Icon(
                    Icons.favorite,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
