// import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:dutchmenserve/Infrastructure/repository.dart';
import 'package:dutchmenserve/main.dart';
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
      emit(UsersLoadingState());
      // final users = await _repository.getUsers();

      emit(UsersLoadedState(
          await _repository.getUsers(), await _repository.getCurrentUser()));
    } catch (e) {
      emit(UsersErrorState());
    }
  }

  void addUser(User u) async {
    try {
      emit(UsersLoadingState());
      await _repository.addUser(u);
      // emit()
    } catch (e) {
      emit(UsersErrorState());
    }
  }

  void findCurrentUser() async {
    try {
      emit(UsersLoadingState());
      await _repository.getCurrentUser();
    } catch (e) {
      emit(UsersErrorState());
    }
  }

  //Needs User with id in order to find user to e updated.
  void editUser(User user) async {
    try {
      emit(UsersLoadingState());
      await _repository.updateUser(user);
      emit(UsersLoadedState(await _repository.getUsers(), await _repository.getCurrentUser()));
    } catch (e) {
      emit(UsersErrorState());
    }
  }

  //currentuser
  //
}
