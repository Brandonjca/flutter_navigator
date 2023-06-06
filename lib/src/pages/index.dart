import 'package:classtwo/src/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(RegisterApp());

bool validateNumeric(String value) {
  final numericRegex = RegExp(r'^[0-9]+$');
  return numericRegex.hasMatch(value);
}

List<String> _sexOptions = ['Masculino', 'Femenino'];
String? _selectedSex;

class RegisterApp extends StatelessWidget {
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
        //   GoRoute(path: "/rojo",builder: (context, state) => RojoPage(),),
      ]),
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
                  SizedBox(height: 16.0),
                  TextField(
                    enableInteractiveSelection: false,
                    autofocus: true,
                    textCapitalization: TextCapitalization
                        .characters, //Cualquier tipo de caracteres
                    controller: _usernameController,
                    decoration: InputDecoration(
                        hintText: 'username',
                        labelText: 'Username',
                        helperText: 'Ingresa tu nombre de usuario',
                        suffixIcon: Icon(Icons.people),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
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
                  TextField(
                    textCapitalization: TextCapitalization.characters,
                    controller: _VerificatePassword,
                    decoration: InputDecoration(
                      labelText: 'Confirmar contraseña',
                      helperText:
                          'Verifica que la contraseña ingresada este bien',
                      suffixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 24.0),
                  TextField(
                    keyboardType: TextInputType.number,
                    enableInteractiveSelection: false,
                    autofocus: true,
                    controller: _celularController,
                    onChanged: (value) {
                      setState(() {
                        if (!validateNumeric(value)) {
                          _celularController.text =
                              value.replaceAll(RegExp(r'[^-9]'), '');
                          _celularController.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset: _celularController.text.length));
                        }
                      });
                    },
                    decoration: InputDecoration(
                        hintText: 'Celular',
                        labelText: 'Celular',
                        helperText: 'Ingresa tu telefono celular',
                        suffixIcon: Icon(Icons.numbers),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  ),
                  SizedBox(height: 24.0),
                  TextField(
                      controller: _birthdateController,
                      autofocus: true,
                      decoration: InputDecoration(
                          hintText: 'Fecha de nacimiento',
                          helperText: 'Ingresa tu fecha de nacimiento',
                          suffixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                      onTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (selectedDate != null) {
                          _birthdateController.text = selectedDate.toString();
                        }
                      }),
                  SizedBox(height: 24.0),
                  DropdownButtonFormField<String>(
                    value: _selectedSex,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedSex = newValue;
                      });
                    },
                    decoration: InputDecoration(
                        labelText: 'Genero',
                        hintText: 'Genero',
                        helperText: 'Ingresa tu genero',
                        suffixIcon: Icon(Icons.question_mark),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                    items: _sexOptions.map((String option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 24.0),
                  ElevatedButton(
                    child: Text('Register'),
                    onPressed: () {
                      String username = _usernameController.text;
                      String password = _passwordController.text;
                      String email = _emailController.text;
                      String celular = _celularController.text;
                      String confirmpassword = _VerificatePassword.text;
                      String birthdate = _birthdateController.text;
                      String? sexo = _selectedSex;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginApp()));

                      // Aquí puedes agregar la lógica de validación de inicio de sesión

                      if (password != confirmpassword) {
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

                      print('Username: $username');
                      print('email: $email');
                      print('Password: $password');
                      print('Verificate Password: $confirmpassword');
                      print('celular: $celular');
                      print('Fecha de nacimiento: $birthdate');
                      print('Genero: $sexo');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
