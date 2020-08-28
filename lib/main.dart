import 'package:flutter/material.dart';
import 'package:login_page/screens/login_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pagina de Registro',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
