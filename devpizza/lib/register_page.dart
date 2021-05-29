import 'package:devpizza/bloc/user_bloc.dart';
import 'package:devpizza/events/add_user.dart';
import 'package:devpizza/model/user.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserForm extends StatefulWidget {
  final User user;
  final int userIndex;

  UserForm({this.user, this.userIndex});

  @override
  State<StatefulWidget> createState() {
    return UserFormState();
  }
}

class UserFormState extends State<UserForm> {
  String _name;
  String _street;
  String _streetNumber;
  String _email;
  String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      initialValue: _name,
      decoration: InputDecoration(labelText: 'Nome'),
      maxLength: 40,
      style: TextStyle(fontSize: 28),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Nome é obrigatório!';
        }
        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildStreet() {
    return TextFormField(
      initialValue: _street,
      decoration: InputDecoration(labelText: 'Endereço'),
      style: TextStyle(fontSize: 28),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Endereço é obrigatório!';
        }
        return null;
      },
      onSaved: (String value) {
        _street = value;
      },
    );
  }

  Widget _buildStreetNumber() {
    return TextFormField(
      initialValue: _streetNumber,
      decoration: InputDecoration(labelText: 'Número'),
      style: TextStyle(fontSize: 28),
      validator: (String value) {
        int number = int.tryParse(value);

        if (number == null || number <= 0) {
          return 'Número da residência é obrigatório!';
        }
        return null;
      },
      onSaved: (String value) {
        _streetNumber = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      initialValue: _email,
      decoration: InputDecoration(labelText: 'Email'),
      maxLength: 40,
      style: TextStyle(fontSize: 28),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email é obrigatório!';
        }
        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      initialValue: _password,
      decoration: InputDecoration(labelText: 'Senha'),
      maxLength: 40,
      style: TextStyle(fontSize: 28),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Senha é obrigatória!';
        }
        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _name = widget.user.name;
      _street = widget.user.street;
      _streetNumber = widget.user.streetNumber;
      _email = widget.user.email;
      _password = widget.user.password;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registrar-se")),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildName(),
              _buildEmail(),
              _buildPassword(),
              _buildStreet(),
              _buildStreetNumber(),
              widget.user == null
                  ? RaisedButton(
                      child: Text(
                        'Cadastrar-se',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }

                        _formKey.currentState.save();

                        Navigator.pop(context);
                      },
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          child: Text(
                            "Update",
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                          onPressed: () {
                            if (!_formKey.currentState.validate()) {
                              print("form");
                              return;
                            }

                            _formKey.currentState.save();

                            Navigator.pop(context);
                          },
                        ),
                        RaisedButton(
                          child: Text(
                            "Cancelar",
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
