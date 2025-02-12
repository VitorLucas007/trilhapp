import 'package:flutter/material.dart';
import 'package:trilhapp/shared/app_images.dart';

class ListViewVPage extends StatefulWidget {
  const ListViewVPage({super.key});

  @override
  State<ListViewVPage> createState() => _ListViewVPageState();
}

class _ListViewVPageState extends State<ListViewVPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
            leading: Image.asset(AppImages.user2),
            title: const Text('Usuario 2'),
            subtitle: const Text('Olá! Tudo bem?'),
            trailing: PopupMenuButton<String>(
              icon: Icon(Icons.settings),
              onSelected: (menu) {},
              itemBuilder: (context) {
                return <PopupMenuEntry<String>>[
                  PopupMenuItem(
                    value: 'opcao1',
                    child: Text('Opção 1'),
                  ),
                  PopupMenuItem(
                    value: 'opcao2',
                    child: Text('Opção 2'),
                  ),
                  PopupMenuItem(
                    value: 'opcao3',
                    child: Text('Opção 3'),
                  ),
                ];
              },
            )),
        Image.asset(AppImages.user1),
        Image.asset(AppImages.user2),
        Image.asset(AppImages.user3),
        Image.asset(AppImages.paisagem1),
        Image.asset(AppImages.paisagem2),
        Image.asset(AppImages.paisagem3),
      ],
    );
  }
}
