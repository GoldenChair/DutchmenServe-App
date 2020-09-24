part of 'events_cubit.dart';

@immutable
abstract class EventsState {
  const EventsState();
}

class EventsInitial extends EventsState {
  const EventsInitial();
}

class EventsLoading extends EventsState {
  const EventsLoading();
}

class EventsLoaded extends EventsState {
  final Events e;
  const EventsLoaded(this.e);
}
