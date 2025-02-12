import 'package:flutter/material.dart';
import 'package:trilhapp/pages/card_page.dart';
import 'package:trilhapp/pages/image_assets.dart';
import 'package:trilhapp/pages/list_view_h.dart';
import 'package:trilhapp/pages/list_view_horizontal_page.dart';
import 'package:trilhapp/pages/tarefa_page.dart';
import 'package:trilhapp/shared/widgets/custom_drawer.dart';

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
        drawer: const CustomDrawer(),
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
                  CardPage(),
                  ImageAssetsPage(),
                  ListViewVPage(),
                  ListViewHorizontalPage(),
                  TarefaPage(),
                ],
              ),
            ),
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
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
                ),
                BottomNavigationBarItem(
                  label: "Lista",
                  icon: Icon(
                    Icons.list,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Tarefas",
                  icon: Icon(
                    Icons.task,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
