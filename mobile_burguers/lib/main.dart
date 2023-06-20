import 'package:flutter/material.dart';

void main() {
  runApp(const APP());
}

class APP extends StatelessWidget {
  const APP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/cardapio': (context) => const AlmocoScreen()
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 242, 204, 12),
        title: const Text(
          'Mobile Burguers',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontFamily: 'Tilt Prism'),
        ),
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.asset(
              'lib/img/home_img.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                    '\n\n Bem Vindo(a) \n Nosso Cardápio está de cara nova! \n Clique no botão abaixo para acessar',
                    style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 22,
                    )),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text('Cardápio'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/cardapio');
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AlmocoScreen extends StatelessWidget {
  const AlmocoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cardápio de Almoço', textAlign: TextAlign.center),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.asset(
              'lib/img/almoco-menu.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 100,
            color: Colors.black.withOpacity(0.5),
            child: const Center(
              child: Text(
                'Um bom dia depende de um bom almoço! \n Bem-vindo(a)!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4, // Número de itens na lista
              itemBuilder: (BuildContext context, int index) {
                return const Column(children: [
                  ListTile(
                    title: Text(
                        'Nome: Big Macas \n Descrição: Dois hmaburgues alface e pão com gergelin \n preco: RS 99.9 \n url: <imagem>'),
                  ),
                  Divider(),
                ]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  String nome;
  String descricao;
  double preco;
  String? url;

  Item(
      {required this.nome,
      required this.descricao,
      required this.preco,
      this.url});
}
