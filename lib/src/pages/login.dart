import 'package:classtwo/src/pages/homePage.dart';
import 'package:classtwo/src/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(LoginApp());

bool validateNumeric(String value) {
  final numericRegex = RegExp(r'^[0-9]+$');
  return numericRegex.hasMatch(value);
}

List<String> _sexOptions = ['Masculino', 'Femenino'];
String? _selectedSex;

class RutasPage extends StatelessWidget {
  const RutasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(routes: [
        GoRoute(
          path: "/",
          builder: (context, state) => RegisterApp(),
        ),
        GoRoute(
          path: "/login",
          builder: (context, state) => LoginApp(),
        ),
        GoRoute(
          path: "/home",
          builder: (context, state) => HomePage(),
        )
        //   GoRoute(path: "/rojo",builder: (context, state) => RojoPage(),),
      ]),
    );
  }
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _celularController = TextEditingController();
  TextEditingController _VerificatePassword = TextEditingController();
  TextEditingController _birthdateController = TextEditingController();
  TextEditingController _sexoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 81, 0),
      body: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 100.0,
                    backgroundColor: Colors.indigoAccent,
                    backgroundImage: NetworkImage(
                        'https://www.mundodeportivo.com/alfabeta/hero/2023/05/goku-sorprendido.webp?width=1200'),
                  ),
                  SizedBox(height: 24.0),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.characters,
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                      helperText: 'Ingresa tu correo electronico',
                      suffixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  TextField(
                    textCapitalization: TextCapitalization.characters,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      helperText: 'Ingresa tu contraseña',
                      suffixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 24.0),
                  ElevatedButton(
                    child: Text('Iniciar sesión'),
                    onPressed: () {
                      String password = _passwordController.text;
                      String email = _emailController.text;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));

                      // Aquí puedes agregar la lógica de validación de inicio de sesión

                      if (password != password) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('ERROR'),
                              content: Text('Las contraseñas no coinciden.'),
                              actions: [
                                TextButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    })
                              ],
                            );
                          },
                        );
                        return;
                      }

                      print('email: $email');
                      print('Password: $password');
                    },
                  ),
                  SizedBox(height: 24.0),
                  ElevatedButton(
                      child: Text('Register'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterApp()));
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
