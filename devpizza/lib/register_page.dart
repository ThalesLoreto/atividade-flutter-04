import 'package:devpizza/bloc/user_bloc.dart';
import 'package:devpizza/db/database_provider.dart';
import 'package:devpizza/events/add_user.dart';
import 'package:devpizza/events/update_user.dart';
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
  String _email;
  String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      initialValue: _name,
      decoration: InputDecoration(labelText: 'Nome'),
      maxLength: 40,
      style: TextStyle(fontSize: 16),
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
      style: TextStyle(fontSize: 16),
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

  Widget _buildEmail() {
    return TextFormField(
      initialValue: _email,
      decoration: InputDecoration(labelText: 'Email'),
      style: TextStyle(fontSize: 16),
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
      style: TextStyle(fontSize: 16),
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
      _email = widget.user.email;
      _password = widget.user.password;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Registrar-se"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildName(),
              _buildEmail(),
              SizedBox(height: 16),
              _buildPassword(),
              SizedBox(height: 16),
              _buildStreet(),
              SizedBox(height: 16),
              widget.user == null
                  ? RaisedButton(
                      child: Text(
                        'Cadastrar-se',
                        style: TextStyle(color: Colors.purple, fontSize: 16),
                      ),
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }

                        _formKey.currentState.save();

                        User user = User(
                          name: _name,
                          email: _email,
                          password: _password,
                          street: _street,
                        );

                        DatabaseProvider.db.insert(user).then(
                              (storedUser) =>
                                  BlocProvider.of<UserBloc>(context).add(
                                AddUser(storedUser),
                              ),
                            );

                        Navigator.pop(context);
                      },
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          child: Text(
                            "Atualizar",
                            style:
                                TextStyle(color: Colors.purple, fontSize: 16),
                          ),
                          onPressed: () {
                            if (!_formKey.currentState.validate()) {
                              print("form");
                              return;
                            }

                            _formKey.currentState.save();

                            User food = User(
                              name: _name,
                              email: _email,
                              street: _street,
                            );

                            DatabaseProvider.db.update(widget.user).then(
                                  (storedFood) =>
                                      BlocProvider.of<UserBloc>(context).add(
                                    UpdateUser(widget.userIndex, food),
                                  ),
                                );

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
