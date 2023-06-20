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




