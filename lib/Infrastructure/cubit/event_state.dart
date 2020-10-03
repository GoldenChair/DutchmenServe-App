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
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedState extends EventState {
  final List<Event> events;

  LoadedState(this.events);

  @override
  List<Object> get props => [events];
}

class LoadedRegisteredState extends EventState {
  final List<User> users;

  LoadedRegisteredState(this.users);

  @override
  List<Object> get props => [users];
}

class ErrorState extends EventState {
  @override
  List<Object> get props => [];
}
