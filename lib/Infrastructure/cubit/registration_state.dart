import 'package:dutchmenserve/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class RegistrationState extends Equatable {}

class InitialState extends RegistrationState {
  List<Object> get props => [];
}

class PostLoadingState extends RegistrationState {
  @override
  List<Object> get props => [];
}

class PostLoadedState extends RegistrationState {
  PostLoadedState(this.users);

  final List<User> users;

  @override
  List<Object> get props => [users];
}

class PostErrorState extends RegistrationState {
  @override
  List<Object> get props => [];
}

class GetLoadingState extends RegistrationState {
  @override
  List<Object> get props => [];
}

class GetLoadedState extends RegistrationState {
  GetLoadedState(this.users);

  final List<User> users;

  @override
  List<Object> get props => [users];
}

class GetErrorState extends RegistrationState {
  @override
  List<Object> get props => [];
}