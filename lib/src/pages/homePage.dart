import 'package:classtwo/src/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text(
          '¡Hola, profe, un 100 pls!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
