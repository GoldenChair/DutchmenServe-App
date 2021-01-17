import 'package:bloc/bloc.dart';
import 'package:dutchmenserve/Infrastructure/repository.dart';
import 'package:dutchmenserve/main.dart';
import 'package:dutchmenserve/models/organization.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:equatable/equatable.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  Repository _repository;

  UsersCubit() : super(UsersInitial()) {
    _repository = getIt<Repository>();
    getUsers();
  }

  void getUsers() async {
    try {
      emit(LoadingState());
      final users = await _repository.getUsers();
      emit(LoadedState(users));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
