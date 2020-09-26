import 'package:dutchmenserve/models/event.dart';
import 'package:equatable/equatable.dart';

abstract class EventsState extends Equatable {}

class InitialState extends EventsState {
  @override
  List<Object> get props => [];
}

class LoadingState extends EventsState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedState extends EventsState {
  LoadedState(this.events);

  final List<Event> events;

  @override
  List<Object> get props => [events];
}

class ErrorState extends EventsState {
  @override
  List<Object> get props => [];
}
