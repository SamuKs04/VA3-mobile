import 'package:flutter/material.dart';

void main() { runApp(const APP());}

class APP extends StatelessWidget{
  const APP ({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => const Home(),
      },
    );
  }
}

class Home extends StatelessWidget{
  const Home ({super.key});

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
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('\n\n Bem Vindo(a) \n Nosso Cardápio está de cara nova! \n Clique no botão abaixo para acessar', style: TextStyle(color: Colors.orangeAccent, fontSize: 22,)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
      




