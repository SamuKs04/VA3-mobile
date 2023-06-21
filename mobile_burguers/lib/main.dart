import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_burguers/startscreen.dart';

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
            child: FutureBuilder<List<Item>>(
              future: Cardapio(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  List<Item> itemList = snapshot.data!;
                  return ListView.builder(
                    itemCount: itemList.length,
                    itemBuilder: (BuildContext context, int index) {
                      Item item = itemList[index];

                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              'Nome: ${item.nome}\nDescrição: ${item.descricao}\nPreço: ${item.preco}\nURL: ${item.url}',
                            ),
                          ),
                          const Divider(),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

Future<List<Item>> Cardapio() async {
  String jsonString = await rootBundle.loadString('lib/json/cardapio.json');
  List<dynamic> listaItens = jsonDecode('lib/json/cardapio.json');
  List<Item> universities = listaItens.map((e) => Item.fromJson(e)).toList();

  return Future.value(universities);
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

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        nome: json['nome'],
        descricao: json['descricao'],
        preco: json['preco'],
        url: json['url'] as String?);
  }
}
