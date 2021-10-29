part of 'users_cubit.dart';

abstract class UsersState extends Equatable {
  // const UsersState();

  // @override
  // List<Object> get props => [];
}

class UsersInitial extends UsersState {
  List<Object> get props => [];
}

class UsersLoadingState extends UsersState {
  @override
  List<Object> get props => [];
}

class UsersLoadedState extends UsersState {
  UsersLoadedState(this.users, this.curUser);
  final User curUser;
  final List<User> users;

  @override
  List<Object> get props => [users];
}

class UsersErrorState extends UsersState {
  @override
  List<Object> get props => [];
}
