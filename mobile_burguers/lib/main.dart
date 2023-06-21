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
          style: TextStyle(
              fontSize: 24,
              fontFamily: 'BebasNeue',
              fontWeight: FontWeight.bold),
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
                          fontFamily: 'BebasNeue')),
                  const SizedBox(height: 180),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/cardapio');
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 50)),
                    child: const Text(
                      'Cardápio',
                      style: TextStyle(fontFamily: 'BebasNeue', fontSize: 24),
                    ),
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
        title: const Text(
          'Cardápio',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'BebasNeue',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
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
                  return Center(child: Text('Erro: ${snapshot.error}'));
                } else {
                  List<Item> itemList = snapshot.data!;
                  return ListView.builder(
                    itemCount: itemList.length,
                    itemBuilder: (BuildContext context, int index) {
                      Item item = itemList[index];
                      return Column(
                        children: [
                          ListTile(
                            leading: Image.asset('${item.url}',),
                            title: Text('${item.nome}',
                              style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'BebasNeue', fontSize: 20, color: Color.fromARGB(255, 70, 70, 70)),
                            ),
                            subtitle: Text(item.descricao, style: const TextStyle(fontFamily: 'BebasNeue', fontSize: 16, color: Colors.black45),),
                            trailing: Text('R\$ ${item.preco}', style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'BebasNeue', fontSize: 20, color: Colors.orange),),
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
  List<Item> itemList = [];

  try {
    List<dynamic> jsonList = jsonDecode(jsonMenu);
    itemList = jsonList.map((jsonItem) {
      return Item(
        nome: jsonItem['nome'],
        descricao: jsonItem['descricao'],
        preco: jsonItem['preco'].toDouble(),
        url: jsonItem['imagem'],
      );
    }).toList();
  } catch (e) {
    print('Erro ao analisar o JSON: $e');
  }

  return itemList;
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

const String jsonMenu = """
  [
  {
    "imagem": "lib/img/x-tudo.jpg",
    "nome": "X-tudo",
    "preco": 25,
    "descricao": "1 hambúrguer, bacon, 50 g de bacon picados,ovo,1 ovo,presunto,2 fatias de presunto,2 fatias de mussarela (cheddar),alface,1 folha de alface,tomate,1 rodela de tomate,pão de hambúrguer,1 pão de hambúrguer,maionese,1 colher de maionese"
  },
  {
    "imagem": "lib/img/X-bacon.jpg",
    "nome": "X-Bacon",
    "preco": 20,
    "descricao": "1 pão francês,1 hambúrguer,1 fatia de presunto, 2 fatias de mussarela,1 pedaço de bacon"
  },
  {
    "imagem": "lib/img/x-salada.jpg",
    "nome": "X-salada",
    "preco": 10.5,
    "descricao": "1 pão francês,1 hambúrguer,1 fatia de presunto, 2 fatias de mussarela, 1 salada"
  },
  {
    "imagem": "lib/img/x-egg.jpg",
    "nome": "X-Egg",
    "preco": 15,
    "descricao": "1 pão francês,1 hambúrguer,1 fatia de presunto, 2 fatias de mussarela,1 ovo"
  },
  {
    "imagem": "lib/img/x-barbecue.jpg",
    "nome": "X-barbecue",
    "preco": 22,
    "descricao": "1 pão francês,1 hambúrguer,1 fatia de presunto, 2 fatias de mussarela,1 pedaço de bacon,1 salada, 1 ovo, molho barbecue"
  },
  {
    "imagem": "lib/img/x-fish.jpg",
    "nome": "X-fish",
    "preco": 28,
    "descricao": "1 pão francês,1 peixe empanado,1 fatia de presunto, 2 fatias de mussarela,1 pedaço de bacon"
  },
  {
    "imagem": "lib/img/x-frango.jpg",
    "nome": "X-frango",
    "preco": 20,
    "descricao": "1 pão francês,1 frango empanado,1 fatia de presunto, 2 fatias de mussarela,1 pedaço de bacon"
  },
  {
    "imagem": "lib/img/x-kids.jpg",
    "nome": "X-kids",
    "preco": 15.5,
    "descricao": "1 pão francês,1 hambúrguer,1 fatia de presunto, 2 fatias de mussarela"
  },
  {
    "imagem": "lib/img/x-monstro.jpg",
    "nome": "X-monstro",
    "preco": 30,
    "descricao": "1 pão francês,3 hambúrguer, 3fatia de presunto, 5 fatias de mussarela,4 fatias de bacon, 5 pedaços de calabresa"
  },
  {
    "imagem": "lib/img/x-churrasco.jpg",
    "nome": "X-churrasco",
    "preco": 35,
    "descricao": "1 pão francês,1 picanha assada,3. fatia de presunto, 2 fatias de mussarela,1 pedaço de bacon, 1 salada, 2 pedaços de calabresa"
  }
]
 """;
