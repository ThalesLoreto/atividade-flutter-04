import 'package:devpizza/events/user_event.dart';
import 'package:devpizza/events/add_user.dart';
import 'package:devpizza/events/set_user.dart';
import 'package:devpizza/model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, List<User>> {
  @override
  List<User> get initialState => List<User>();

  @override
  Stream<List<User>> mapEventToState(UserEvent event) async* {
    if (event is SetUsers) {
      yield event.userList;
    } else if (event is AddUser) {
      List<User> newState = List.from(state);
      if (event.newUser != null) {
        newState.add(event.newUser);
      }
      yield newState;
    }
  }
}
