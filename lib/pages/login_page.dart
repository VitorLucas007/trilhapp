import 'package:flutter/material.dart';
import 'package:trilhapp/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController senhaController = TextEditingController(text: "");
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          body: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        Expanded(
                          flex: 5,
                          child: Image.network(
                            "https://imgs.search.brave.com/KwBNMFMNQz7oTk8WhyPDoILTKpqP4ViptQu3azQnPVg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9hYy1s/YW5kaW5nLXBhZ2Vz/LXVzZXItdXBsb2Fk/cy1wcm9kdWN0aW9u/LnMzLmFtYXpvbmF3/cy5jb20vMDAwMDA1/MTY1Ny81N2E5OTYx/My1lMTU4LTQ3MmEt/ODAzNy03Nzg5NWVl/ODk5MjMucG5n",
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Ja tem Cadastro ?",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Faça seu login e make the change_",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      height: 30,
                      alignment: Alignment.center,
                      child: TextField(
                        controller: emailController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(top: 0),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 90, 16, 101),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 90, 16, 101),
                            ),
                          ),
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 90, 16, 101),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      height: 30,
                      alignment: Alignment.center,
                      child: TextField(
                        obscureText: isObscureText,
                        controller: senhaController,
                        onChanged: (value) {
                          debugPrint(value);
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 0),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 90, 16, 101),
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 90, 16, 101),
                            ),
                          ),
                          hintText: "Senha",
                          hintStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Color.fromARGB(255, 90, 16, 101),
                          ),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                            child: Icon(
                              isObscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                      height: 30,
                      alignment: Alignment.center,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: const Size(350, 60),
                          backgroundColor:
                              const Color.fromARGB(255, 90, 16, 101),
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          if (emailController.text.trim() == "email@email" &&
                              senhaController.text.trim() == "1234") {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Login feito com sucesso"),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Erro ao efetuar login"),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          "ENTRAR",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      height: 30,
                      alignment: Alignment.center,
                      child: const Text(
                        "Esqueci minha senha",
                        style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      height: 30,
                      alignment: Alignment.center,
                      child: const Text(
                        "Criar conta",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
