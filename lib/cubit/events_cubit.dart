import 'package:bloc/bloc.dart';
import 'package:dutchmenserve/models/events.dart';
import 'package:dutchmenserve/models/events_repo.dart';
import 'package:meta/meta.dart';

part 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  final EventRepo _eRepo;

  EventsCubit(this._eRepo) : super(EventsInitial());

  Future<void> getEvents(List entries) async {
    emit(EventsLoading());
    final e = await _eRepo.fetchEvents(entries);
    emit(EventsLoaded(e));
  }
}
