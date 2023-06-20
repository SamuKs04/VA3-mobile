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
        title: const Text('Mobile Burgues', textAlign: TextAlign.center,)

      ),
    );
  }
}




