import 'package:dutchmenserve/Presentation/initialHomePage.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';

import 'Presentation/ProfilePage.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return MaterialApp(
      home: InitialLoginHome(),
      routes: <String, WidgetBuilder>{
        '/profile': (BuildContext context) => new ProfilePage(),
      },
    );
  }
}
