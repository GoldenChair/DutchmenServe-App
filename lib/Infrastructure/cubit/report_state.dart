import 'package:dutchmenserve/models/report.dart';
import 'package:equatable/equatable.dart';

abstract class ReportState extends Equatable {}

class ReportInitialState extends ReportState {
  @override
  List<Object> get props => [];
}

class ReportLoadingState extends ReportState {
  @override
  List<Object> get props => [];
}

class ReportLoadedState extends ReportState {
  final List<Report> reports;

  ReportLoadedState(this.reports);

  @override
  List<Object> get props => [reports];
}

class ReportErrorState extends ReportState {
  @override
  List<Object> get props => [];
}
