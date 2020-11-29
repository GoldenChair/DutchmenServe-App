import 'package:dutchmenserve/Infrastructure/cubit/event_state.dart';
import 'package:dutchmenserve/Infrastructure/repository.dart';
import 'package:dutchmenserve/main.dart';
import 'package:dutchmenserve/models/event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventCubit extends Cubit<EventState> {
  Repository _repository;

  EventCubit() : super(InitialState()) {
    _repository = getIt<Repository>();
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

  // someone wants to remove event(s)
  Future<void> removeEvent(Event e) async {
    try {
      emit(LoadingState());
      await _repository.deleteEvent(e);
      final events = await _repository.getEvents();
      emit(LoadedState(events));
    } catch (e) {
      emit(ErrorState());
    }
  }

  // someone wants to add event(s)
  Future<void> addEvent(Event e) async {
    try {
      emit(LoadingState());
      int id = await _repository.addEvent(e);
      e.setID(id);
      final events = await _repository.getEvents();
      emit(LoadedState(events));
    } catch (e) {
      emit(ErrorState());
    }
  }

  // someone wants to edit an event's info
  Future<void> replaceEvent(Event olde,
      {String eventName,
      String date,
      String location,
      String description,
      List<String> interests,
      String imagePath}) async {
    try {
      emit(LoadingState());
      await _repository.updateEvent(olde,
          eventName: eventName,
          date: date,
          location: location,
          description: description,
          interests: interests,
          imagePath: imagePath);
      final events = await _repository.getEvents();
      emit(LoadedState(events));
    } catch (e) {
      emit(ErrorState());
    }
  }
}