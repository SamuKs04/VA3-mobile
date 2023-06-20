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
        '/almoco': (context) => AlmocoScreen()
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
          'Mobile Burgues',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Bem Vindes(a) \n '),
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
        title: const Text('Cardápio de Almoço', textAlign: TextAlign.center),
      ),
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.asset(
                  'lib/img/almoco-menu.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                      height: 100,
                      color: Colors.black.withOpacity(0.5),
                      child: const Center(
                          child: Text(
                              'Um bom dia depende de um bom almoço! \n Bem-vindo(a)!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)))))
            ],
          ),
        ],
      ),
    );
  }
}

class item {
  String nome;
  String descricao;
  double preco;
  String? url;

  item(
      {required this.nome,
      required this.descricao,
      required this.preco,
      this.url});
}
