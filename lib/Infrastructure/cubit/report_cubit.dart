import 'package:dutchmenserve/Infrastructure/cubit/report_state.dart';
import 'package:dutchmenserve/Infrastructure/repository.dart';
import 'package:dutchmenserve/main.dart';
import 'package:dutchmenserve/models/event.dart';
import 'package:dutchmenserve/models/interest.dart';
import 'package:dutchmenserve/models/organization.dart';
import 'package:dutchmenserve/models/report.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dutchmenserve/models/Constants.dart';

class ReportCubit extends Cubit<ReportState> {
  Repository _repository;

  ReportCubit() : super(ReportInitialState()) {
    _repository = getIt<Repository>();
  }

  // students want to see how many hours they have
  void getReports(int uid) async {
    try {
      emit(ReportLoadingState());
      emit(ReportLoadedState(await _repository.getReports(uid), await _repository.getEvents(), Constants().interestsMap));
    } catch (e) {
      emit(ReportErrorState());
    }
  }

  // someone wants to submit report
  Future<void> submitReport(Report r) async {
    try {
      emit(SendReportLoadingState());
      final success = await _repository.addReport(r);
      final event = await _repository.getEvent(r.eid);
      if (success.compare(r))
        emit(SendReportSuccessState(event.eventName));
      else
        emit(SendReportFailedState(event.eventName));
      final reports = await _repository.getReports(r.uid);
      final events = await _repository.getEvents();
      // TODO: Temporay fix for interests
      // final interests = await _repository.getInterests();
      final interestsT = Constants().interestsMap;
      emit(ReportLoadedState(reports, events, interestsT));
    } catch (e) {
      emit(ReportErrorState());
    }
  }

  Future<void> submitIReport(
      Event e, double hrs, User u, Organization o) async {
    try {
      emit(SendReportLoadingState());
      final event = await _repository.addEvent(e);
      DateTime now = new DateTime.now();
      DateTime date = new DateTime(now.year, now.month, now.day);
      //TODO changing the description to something that is grabbed from
      // user input might be prefered
      Report r = new Report(event, hrs, u, o, e.date, date, e.description);
      final success = await _repository.addReport(r);
      if (success.compare(r))
        emit(SendReportSuccessState(event.eventName));
      else
        emit(SendReportFailedState(event.eventName));
      final reports = await _repository.getReports(r.uid);
      final events = await _repository.getEvents();
      // TODO: Temporay fix for interests
      // final interests = await _repository.getInterests();
      final interestsT = Constants().interestsMap;
      emit(ReportLoadedState(reports, events, interestsT));
    } catch (e) {
      emit(ReportErrorState());
    }
  }

  // jen wants to delete report
  // Future<void> deleteReport(Report r) async {
  //   try {
  //     // emit(ReportLoadingState());
  //     r.deleted = true;
  //     // final reports = await _repository.getReports();
  //     // emit(ReportLoadedState(reports));
  //   } catch (e) {
  //     emit(ReportErrorState());
  //   }
  // }

  // // jen wants to edit report
  // Future<void> editReport(Report oldr,
  //     {Event event,
  //     double hours,
  //     User user,
  //     List<User> additional,
  //     List<String> imagepaths}) async {
  //   try {
  //     emit(ReportLoadingState());
  //     await _repository.updateReport(oldr,
  //         event: event,
  //         hours: hours,
  //         user: user,
  //         additional: additional,
  //         imagepaths: imagepaths);
  //     final reports = await _repository.getReports();
  //     emit(ReportLoadedState(reports));
  //   } catch (e) {
  //     emit(ReportErrorState());
  //   }
  // }
}
