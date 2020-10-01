import 'package:dutchmenserve/models/event.dart';
import 'package:dutchmenserve/models/report.dart';
import 'package:dutchmenserve/models/user.dart';

abstract class ReportRepository {
  // students want to see how many hours they have
  Future<List<Report>> getReports();
  // someone wants to submit report
  Future<void> submitReport(Report r);
  // jen wants to delete report
  Future<void> deleteReport(Report r);
  // jen wants to edit report
  Future<void> editReport(Report oldr, Report newr);
}

class FakeReportRepository implements ReportRepository {
  @override
  Future<List<Report>> getReports() {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        User u = new User();
        u.setUsername("ajl008");
        u.setEmail();

        return [
          Report(
              new Event('AFCA', '9/28/2020 5:50 PM', 'here', '..', ['health'],
                  imagePath: '/'),
              1.25,
              User(),
              [u, u, u],
              null),
          Report(
              new Event(
                  'Compeer', '9/28/2020 5:50 PM', 'there', '..', ['seniors'],
                  imagePath: '/'),
              1.25,
              User(),
              [u, u, u],
              null),
        ];
      },
    );
  }

  @override
  Future<void> deleteReport(Report r) {
    // TODO: implement deleteReport
    return Future.delayed(
      Duration(seconds: 1),
      () {
        print("DELETED");
        r.printReport();
      },
    );
  }

  @override
  Future<void> submitReport(Report r) {
    // TODO: implement submitReport
    return Future.delayed(
      Duration(seconds: 1),
      () {
        print("SUBMITTED");
        r.printReport();
      },
    );
  }

  @override
  Future<void> editReport(Report oldr, Report newr) {
    // TODO: implement editReport
    return Future.delayed(
      Duration(seconds: 1),
      () {
        deleteReport(oldr);
        submitReport(newr);
        print("EDITED");
      },
    );
  }
}
