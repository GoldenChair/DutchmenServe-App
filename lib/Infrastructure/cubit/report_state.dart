import 'package:dutchmenserve/models/report.dart';
import 'package:equatable/equatable.dart';

abstract class ReportState extends Equatable {}

class InitialState extends ReportState {
  @override
  List<Object> get props => [];
}

class LoadingState extends ReportState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedState extends ReportState {
  final List<Report> reports;

  LoadedState(this.reports);

  @override
  List<Object> get props => [reports];
}

class ErrorState extends ReportState {
  @override
  List<Object> get props => [];
}
