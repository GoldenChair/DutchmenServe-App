import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'Presentation/homePage.dart';
import 'Presentation/profilePage.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return MaterialApp(
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        '/profile': (BuildContext context) => new ProfilePage(),
      },
    );
  }
}
