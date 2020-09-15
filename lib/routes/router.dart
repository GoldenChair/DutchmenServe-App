import 'package:auto_route/auto_route_annotations.dart';
import 'package:dutchmenserve/Presentation/EventsList.dart';
import 'package:dutchmenserve/Presentation/EventsOngoing.dart';
import 'package:dutchmenserve/Presentation/FavoritedPage.dart';
import 'package:dutchmenserve/Presentation/NotificationsPage.dart';
import 'package:dutchmenserve/Presentation/OrganizationsPage.dart';
import 'package:dutchmenserve/Presentation/ProfilePage.dart';
import 'package:dutchmenserve/Presentation/RegisteredPage.dart';
import 'package:dutchmenserve/Presentation/ReportGroupAddStudents.dart';
import 'package:dutchmenserve/Presentation/ReportHoursPage.dart';
import 'package:dutchmenserve/Presentation/ReportIndividual.dart';
import 'package:dutchmenserve/Presentation/homePage.dart';
import 'package:dutchmenserve/Presentation/organizationInfo.dart';
import 'package:dutchmenserve/Presentation/setUpProfile.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: HomePage, initial: true),
    MaterialRoute(page: EventsList),
    MaterialRoute(page: EventsOngoing),
    MaterialRoute(page: FavoritedPage),
    MaterialRoute(page: NotificationsPage),
    MaterialRoute(page: OrganizationInfo),
    MaterialRoute(page: OrganizationsPage),
    MaterialRoute(page: ProfilePage),
    MaterialRoute(page: RegisteredPage),
    MaterialRoute(page: ReportGroupAddStudents),
    MaterialRoute(page: ReportHoursPage),
    MaterialRoute(page: ReportIndividual),
    MaterialRoute(page: LoginHome),
  ],
)
class $Router {}