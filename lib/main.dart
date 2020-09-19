import 'package:dutchmenserve/Presentation/NotificationsPage.dart';
import 'package:dutchmenserve/Presentation/initialHomePage.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'Presentation/ProfilePage.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return MaterialApp(
      // builder: ExtendedNavigator.builder(
      //   router: Router(),
      //   builder: (context, extendedNav) => Theme(
      //     data: ThemeData(brightness: Brightness.dark),
      //     child: extendedNav,
      //   ),
      // ),

      // initialRoute: Routes.homePage,
      // onGenerateRoute: ,
      // navigatorKey: ,

      home: InitialLoginHome(),
      routes: <String, WidgetBuilder>{
        '/profile': (BuildContext context) => new ProfilePage(),
      },
    );
  }
}
