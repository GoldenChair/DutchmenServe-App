import 'package:bloc/bloc.dart';
import 'package:dutchmenserve/Infrastructure/repository.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:equatable/equatable.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit({this.repo}) : super(UsersInitial());
  final Repository repo;
  void getUsers() async {
    try {
      emit(LoadingState());
      final users = [
        User(
          emailAddress: "mjs016@lvc.edu",
          interests: ['animals'],
          org: [1],
          password: "password",
          username: "mjs016",
          events: [],
        ),
        User(
          emailAddress: "ajl008@lvc.edu",
          interests: ['community'],
          org: [1, 2, 3],
          password: "password",
          username: "ajl008",
          events: [],
        ),
        User(
          emailAddress: "yarnall@lvc.edu",
          interests: ['computers'],
          org: [3],
          password: "password",
          username: "yarnall",
          events: [],
        ),
      ];
      emit(LoadedState(users));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
