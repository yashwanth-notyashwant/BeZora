import 'package:flutter/material.dart';
import 'dart:ui';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GeeksforGeeks'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        // heightFactor: 3,
        // widthFactor: 0.8,
        child: Container(
          color: Colors.green,
          child: Text(
            'Center Widget',
            textScaleFactor: 3,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
