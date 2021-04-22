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

class ErrorState extends EventState {
  @override
  List<Object> get props => [];
}

class RegistrationSuccessState extends EventState {
  RegistrationSuccessState(this.eventName);

  final String eventName;
  @override
  List<Object> get props => [eventName];
}

class RegistrationFailedState extends EventState {
  RegistrationFailedState(this.eventName);
  final String eventName;

  @override
  List<Object> get props => [eventName];
}

class UnregisterSuccessState extends EventState {
  UnregisterSuccessState(this.eventName);
  final String eventName;
  @override
  List<Object> get props => [eventName];
}

class UnregisterFailedState extends EventState {
  UnregisterFailedState(this.eventName);
  final String eventName;
  @override
  List<Object> get props => [eventName];
}
