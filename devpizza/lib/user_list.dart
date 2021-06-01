import 'package:devpizza/bloc/user_bloc.dart';
import 'package:devpizza/db/database_provider.dart';
import 'package:devpizza/events/set_user.dart';
import 'package:devpizza/home_page.dart';
import 'package:devpizza/model/user.dart';
import 'package:devpizza/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatefulWidget {
  const UserList({Key key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  void initState() {
    super.initState();
    DatabaseProvider.db.getUsers().then(
      (userList) {
        BlocProvider.of<UserBloc>(context).add(SetUsers(userList));
      },
    );
  }

  showUserDialog(BuildContext context, User user, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(user.name),
        content: Text("ID ${user.id}"),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => UserForm(user: user, userIndex: index),
              ),
            ),
            child: Text("Atualizar"),
          ),
          FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancelar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        color: Colors.grey,
        child: BlocConsumer<UserBloc, List<User>>(
          builder: (context, userList) {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                User user = userList[index];
                return Card(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    title: Text(user.name, style: TextStyle(fontSize: 26)),
                    subtitle: Text(
                      "Email: ${user.email}\nEndereço: ${user.street}",
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () => showUserDialog(context, user, index),
                  ),
                );
              },
              itemCount: userList.length,
            );
          },
          listener: (BuildContext context, userList) {},
        ),
      ),
    );
  }
}
