import 'package:dutchmenserve/Infrastructure/eventRepository.dart';
import 'package:dutchmenserve/models/event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  final EventRepository _repository;

  EventCubit(this._repository) : super(InitialState()) {
    getEvents();
  }

  // students want to see what events are available
  Future<void> getEvents() async {
    try {
      emit(LoadingState());
      final events = await _repository.getEvents();
      emit(LoadedState(events));
    } catch (e) {
      emit(ErrorState());
    }
  }

  // Jen wants to see which students are registered for an event
  Future<void> getRegistered(Event event) async {
    try {
      emit(LoadingState());
      final users = await _repository.getRegistered(event);
      emit(LoadedRegisteredState(users));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
