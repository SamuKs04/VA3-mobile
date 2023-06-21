import 'package:flutter/material.dart';
import 'package:mobile_burguers/startscreen.dart';
import 'startscreen.dart';

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
      home: const StartScreen(),
      routes: {
        '/home': (context) => const Home(),
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
        backgroundColor: Colors.yellow,
        title: const Text(
          'Mobile Burguers',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontFamily: 'BebasNeue', fontWeight: FontWeight.bold),
        ),
        titleTextStyle: const TextStyle(color: Colors.black),
      ),
      body: Container( 
        color: Colors.black,
        child: Column(
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
                    '\n\n\n Bem Vindo(a)! \n Nosso Cardápio está de cara nova! \n Clique no botão abaixo para acessar',
                    style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 26,
                      fontFamily: 'BebasNeue'
                    )),
                const SizedBox(height: 180),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cardapio');
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 50)
                  ),
                  child: const Text('Cardápio', style: TextStyle(fontFamily: 'BebasNeue', fontSize: 24),),
                )
              ],
            ),
          ),
        ],
      ),
      
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
        title: const Text('Cardápio', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'BebasNeue', fontSize: 24, fontWeight: FontWeight.bold),),
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
            color: Colors.yellow,
            child: const Center(
              child: Text(
                'Um bom dia depende de um bom lanche! \n Bem-vindo(a)!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontFamily: 'BebasNeue',
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
