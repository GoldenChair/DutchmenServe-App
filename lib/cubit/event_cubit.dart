import 'package:dutchmenserve/models/eventsRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event_state.dart';

class EventsCubit extends Cubit<EventsState> {
  EventsCubit({this.repository}) : super(InitialState()) {
    _getNewEvents();
  }

  final EventsRepository repository;

  void _getNewEvents() async {
    try {
      emit(LoadingState());
      final events = await repository.getEvents();
      emit(LoadedState(events));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
