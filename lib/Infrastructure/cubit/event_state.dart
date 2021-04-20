import 'package:dutchmenserve/models/event.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class EventState extends Equatable {}

class InitialState extends EventState {
  @override
  List<Object> get props => [];
}

class LoadingState extends EventState {
  @override
  List<Object> get props => [];
}

class LoadedState extends EventState {
  LoadedState(this.events);

  final List<Event> events;

  @override
  List<Object> get props => [events];
}

class LoadedRegisteredState extends EventState {
  LoadedRegisteredState(this.users);
  
  final List<User> users;

  @override
  List<Object> get props => [users];
}

class ErrorState extends EventState {
  @override
  List<Object> get props => [];
}

class RegistrationSuccessState extends EventState {
    @override
    List<Object> get props => [];
}

class RegistrationFailedState extends EventState {
    @override
    List<Object> get props => [];
}

class UnregisterSuccessState extends EventState {
    @override
    List<Object> get props => [];
}

class UnregisterFailedState extends EventState {
    @override
    List<Object> get props => [];
}
