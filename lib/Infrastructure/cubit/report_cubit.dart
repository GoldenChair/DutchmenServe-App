import 'package:dutchmenserve/Infrastructure/cubit/report_state.dart';
import 'package:dutchmenserve/Infrastructure/reportRepository.dart';
import 'package:dutchmenserve/models/report.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event_state.dart';

class ReportCubit extends Cubit<ReportState> {
  final ReportRepository _repository;

  ReportCubit(this._repository) : super(ReportInitialState()) {
    getReports();
  }

  // students want to see how many hours they have
  Future<void> getReports() async {
    try {
      emit(ReportLoadingState());
      final reports = await _repository.getReports();
      emit(ReportLoadedState(reports));
    } catch (e) {
      emit(ReportErrorState());
    }
  }

  // someone wants to submit report
  Future<void> submitReport(Report r) async {
    try {
      emit(ReportLoadingState());
      await _repository.submitReport(r);
      final reports = await _repository.getReports();
      emit(ReportLoadedState(reports));
    } catch (e) {
      emit(ReportErrorState());
    }
  }

  // jen wants to delete report
  Future<void> deleteReport(Report r) async {
    try {
      emit(ReportLoadingState());
      await _repository.deleteReport(r);
      final reports = await _repository.getReports();
      emit(ReportLoadedState(reports));
    } catch (e) {
      emit(ReportErrorState());
    }
  }

  // jen wants to edit report
  Future<void> editReport(Report oldr, Report newr) async {
    try {
      emit(ReportLoadingState());
      await _repository.editReport(oldr, newr);
      final reports = await _repository.getReports();
      emit(ReportLoadedState(reports));
    } catch (e) {
      emit(ReportErrorState());
    }
  }
}
