import 'package:dutchmenserve/Infrastructure/repository.dart';
import 'package:dutchmenserve/Presentation/ProfilePage.dart';
import 'package:dutchmenserve/Presentation/initialHomePage.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;

import 'models/event.dart';

final GetIt getIt = GetIt.instance;

void main() async {
  // GetIt.I.registerSingleton<Repository>(FakeRepository());
  // runApp(MyApp());
  
  // cd lib\Server\appserver 
  // python manage.py runserver 5455
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
