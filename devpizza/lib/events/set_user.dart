import 'package:devpizza/model/user.dart';

import 'user_event.dart';

class SetUsers extends UserEvent {
  List<User> userList;

  SetUsers(List<User> users) {
    userList = users;
  }
}
