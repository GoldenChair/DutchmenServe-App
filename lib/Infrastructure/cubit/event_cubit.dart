import 'package:dutchmenserve/Infrastructure/eventRepository.dart';
import 'package:dutchmenserve/models/event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event_state.dart';

class EventsCubit extends Cubit<EventState> {
  final EventRepository _repository;

  EventsCubit(this._repository) : super(InitialState()) {
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
      emit(LoadingState()); final users = await _repository.getRegistered(event);
      emit(LoadedRegisteredState(users));
    } catch (e) {
      emit(ErrorState());
    }
  }

  // someone wants to remove event(s)
  Future<void> removeEvents(List<Event> le) async {
    try {
      emit(LoadingState());
      await _repository.removeEvents(le);
      final events = await _repository.getEvents();
      emit(LoadedState(events));
    } catch (e) {
      emit(ErrorState());
    }
  }

  // someone wants to add event(s)
  Future<void> addEvents(List<Event> ae) async {
    try {
      emit(LoadingState());
      await _repository.addEvents(ae);
      final events = await _repository.getEvents();
      emit(LoadedState(events));
    } catch (e) {
      emit(ErrorState());
    }
  }

  // someone wants to edit an event's info
  Future<void> replaceEvent(Event olde, Event newe) async {
    try {
      emit(LoadingState());
      await _repository.replaceEvent(olde, newe);
      final events = await _repository.getEvents();
      emit(LoadedState(events));
    } catch (e) {
      emit(ErrorState());
    }
  }
}