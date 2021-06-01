import 'package:devpizza/bloc/user_bloc.dart';
import 'package:devpizza/home_page.dart';
import 'package:devpizza/login_page.dart';
import 'package:devpizza/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sqflite Tutorial',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: LoginPage(),
      ),
    );
  }
}
