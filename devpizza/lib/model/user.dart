import 'package:devpizza/db/database_provider.dart';

class User {
  int id;
  String name;
  String street;
  String email;
  String password;

  User({this.id, this.name, this.email, this.street, this.password});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.COLUMN_ID: id,
      DatabaseProvider.COLUMN_NAME: name,
      DatabaseProvider.COLUMN_EMAIL: email,
      DatabaseProvider.COLUMN_PASSWORD: password,
      DatabaseProvider.COLUMN_STREET: street,
    };

    if (id != null) {
      map[DatabaseProvider.COLUMN_ID] = id;
    }

    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    id = map[DatabaseProvider.COLUMN_ID];
    name = map[DatabaseProvider.COLUMN_NAME];
    email = map[DatabaseProvider.COLUMN_EMAIL];
    password = map[DatabaseProvider.COLUMN_PASSWORD];
    street = map[DatabaseProvider.COLUMN_STREET];
  }
}
