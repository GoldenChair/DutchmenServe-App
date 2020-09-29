import 'package:dutchmenserve/Infrastructure/eventsRepository.dart';
import 'package:dutchmenserve/models/event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event_state.dart';

class EventsCubit extends Cubit<EventsState> {
  final EventsRepository _repository;

  EventsCubit(this._repository) : super(InitialState()) {
    getEvents();
  }

  Future<void> getEvents() async {
    try {
      emit(LoadingState());
      final events = await _repository.getEvents();
      emit(LoadedState(events));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
