import 'package:dutchmenserve/models/organizationsRepository.dart';
import 'package:dutchmenserve/models/organizationsRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event_state.dart';

class EventsCubit extends Cubit<EventState> {
  EventsCubit({this.repository}) : super(InitialState()) {
    _getEvents();
  }

  final EventsRepository repository;

  void _getEvents() async {
    try {
      emit(LoadingState());
      final events = await repository.getEvents();
      emit(LoadedState(events));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
