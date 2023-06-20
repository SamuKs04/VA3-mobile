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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text('Bem Vindes(a) \n '),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Ver almoços'),
              onPressed: () {
                Navigator.pushNamed(context, '/almoco');
              },
            )
          ],
        ),
      ),
    );
  }
}

class AlmocoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cardápio de Almoço', textAlign: TextAlign.center),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                'lib/img/almoco-menu.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
