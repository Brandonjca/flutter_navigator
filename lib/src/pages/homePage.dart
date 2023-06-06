import 'package:classtwo/src/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// class RutasPage extends StatelessWidget {
//   const RutasPage({super.key});

// @override
// Widget build(BuildContext context) {
//   return MaterialApp.router(
//     routerConfig: GoRouter(routes: [
//       GoRoute(
//         path: "/",
//         builder: (context, state) => RegisterApp(),
//       ),
//       GoRoute(
//         path: "/login",
//         builder: (context, state) => LoginApp(),
//       ),
//       //   GoRoute(path: "/rojo",builder: (context, state) => RojoPage(),),
//     ]),
//   );
//   }
// }

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
