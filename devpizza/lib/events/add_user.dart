import 'package:devpizza/model/user.dart';
import 'user_event.dart';

class AddUser extends UserEvent {
  User newUser;

  AddUser(User user) {
    newUser = user;
  }
}
