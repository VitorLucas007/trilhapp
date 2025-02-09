import 'package:flutter/material.dart';
import 'package:trilhapp/pages/dados_cadastrais.dart';
import 'package:trilhapp/pages/login_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                context: context,
                builder: (context) {
                  return Wrap(
                    children: [
                      ListTile(
                        onTap: () => Navigator.pop(context),
                        title: const Text('Camera'),
                        leading: const Icon(Icons.camera),
                      ),
                      ListTile(
                        onTap: () => Navigator.pop(context),
                        title: const Text('Galeria'),
                        leading: const Icon(Icons.photo_album),
                      )
                    ],
                  );
                },
              );
            },
            child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.orange),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.network(
                    'https://images.crunchbase.com/image/upload/c_pad,h_256,w_256,f_auto,q_auto:eco,dpr_1/r0rx7o4jm6jy2uvzt7xk',
                  ),
                ),
                accountName: const Text('Vitor Lucas'),
                accountEmail: const Text('email@email.com')),
          ),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Dados Cadastrais"),
                    ],
                  )),
            ),
          ),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                context: context,
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    child: const Column(
                      children: [
                        Text(
                          'Termos de uso e privacidade',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          ' O incentivo ao avanço tecnológico, assim como o acompanhamento das preferências de consumo deve passar por modificações independentemente do sistema de formação de quadros que corresponde às necessidades. Desta maneira, o entendimento das metas propostas obstaculiza a apreciação da importância dos métodos utilizados na avaliação de resultados. O cuidado em identificar pontos críticos no consenso sobre a necessidade de qualificação estende o alcance e a importância do investimento em reciclagem técnica. Todas estas questões, devidamente ponderadas, levantam dúvidas sobre se o comprometimento entre as equipes maximiza as possibilidades por conta de alternativas às soluções ortodoxas.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.info),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Termos de uso e privacidade"),
                ],
              ),
            ),
          ),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Configurações"),
                ],
              ),
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: const Row(
                children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Sair')
                ],
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    alignment: Alignment.centerLeft,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    title: const Text(
                      'Meu App',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: const Wrap(
                      children: [
                        Text('Você saira do aplicativo !'),
                        Text('Deseja realmente sair do aplicativo ?')
                      ],
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Não')),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: const Text('Sim'))
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
