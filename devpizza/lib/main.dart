import 'package:flutter/material.dart';
import 'login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'DevPizza';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      //home: HomePage(title: appTitle),
      home: LoginPage(),
    );
  }
}
