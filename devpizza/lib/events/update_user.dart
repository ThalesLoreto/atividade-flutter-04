import 'package:devpizza/events/user_event.dart';
import 'package:devpizza/model/user.dart';

class UpdateUser extends UserEvent {
  User newUser;
  int userIndex;

  UpdateUser(int index, User user) {
    newUser = user;
    userIndex = index;
  }
}
