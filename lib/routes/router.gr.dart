// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../Presentation/EventsList.dart';
import '../Presentation/EventsOngoing.dart';
import '../Presentation/FavoritedPage.dart';
import '../Presentation/NotificationsPage.dart';
import '../Presentation/OrganizationsPage.dart';
import '../Presentation/ProfilePage.dart';
import '../Presentation/RegisteredPage.dart';
import '../Presentation/ReportGroupAddStudents.dart';
import '../Presentation/ReportHoursPage.dart';
import '../Presentation/ReportIndividual.dart';
import '../Presentation/homePage.dart';
import '../Presentation/organizationInfo.dart';

class Routes {
  static const String homePage = '/';
  static const String eventsList = '/events-list';
  static const String eventsOngoing = '/events-ongoing';
  static const String favoritedPage = '/favorited-page';
  static const String notificationsPage = '/notifications-page';
  static const String organizationInfo = '/organization-info';
  static const String organizationsPage = '/organizations-page';
  static const String profilePage = '/profile-page';
  static const String registeredPage = '/registered-page';
  static const String reportGroupAddStudents = '/report-group-add-students';
  static const String reportHoursPage = '/report-hours-page';
  static const String reportIndividual = '/report-individual';
  static const String loginHome = '/login-home';
  static const all = <String>{
    homePage,
    eventsList,
    eventsOngoing,
    favoritedPage,
    notificationsPage,
    organizationInfo,
    organizationsPage,
    profilePage,
    registeredPage,
    reportGroupAddStudents,
    reportHoursPage,
    reportIndividual,
    loginHome,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.eventsList, page: EventsList),
    RouteDef(Routes.eventsOngoing, page: EventsOngoing),
    RouteDef(Routes.favoritedPage, page: FavoritedPage),
    RouteDef(Routes.notificationsPage, page: NotificationsPage),
    RouteDef(Routes.organizationInfo, page: OrganizationInfo),
    RouteDef(Routes.organizationsPage, page: OrganizationsPage),
    RouteDef(Routes.profilePage, page: ProfilePage),
    RouteDef(Routes.registeredPage, page: RegisteredPage),
    RouteDef(Routes.reportGroupAddStudents, page: ReportGroupAddStudents),
    RouteDef(Routes.reportHoursPage, page: ReportHoursPage),
    RouteDef(Routes.reportIndividual, page: ReportIndividual),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomePage(),
        settings: data,
      );
    },
    EventsList: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => EventsList(),
        settings: data,
      );
    },
    EventsOngoing: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => EventsOngoing(),
        settings: data,
      );
    },
    FavoritedPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => FavoritedPage(),
        settings: data,
      );
    },
    NotificationsPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => NotificationsPage(),
        settings: data,
      );
    },
    OrganizationInfo: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => OrganizationInfo(),
        settings: data,
      );
    },
    OrganizationsPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => OrganizationsPage(),
        settings: data,
      );
    },
    ProfilePage: (data) {
      final args = data.getArgs<ProfilePageArguments>(
        orElse: () => ProfilePageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfilePage(key: args.key),
        settings: data,
      );
    },
    RegisteredPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisteredPage(),
        settings: data,
      );
    },
    ReportGroupAddStudents: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ReportGroupAddStudents(),
        settings: data,
      );
    },
    ReportHoursPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ReportHoursPage(),
        settings: data,
      );
    },
    ReportIndividual: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ReportIndividual(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ProfilePage arguments holder class
class ProfilePageArguments {
  final Key key;
  ProfilePageArguments({this.key});
}
