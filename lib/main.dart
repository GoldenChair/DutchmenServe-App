import 'package:dutchmenserve/Infrastructure/repository.dart';
import 'package:dutchmenserve/Presentation/ProfilePage.dart';
import 'package:dutchmenserve/Presentation/initialHomePage.dart';
import 'package:dutchmenserve/Presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
// import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter/services.dart';

final GetIt getIt = GetIt.instance;

void main() async {
  
  GetIt.I.registerSingleton<Repository>(FakeRepository());
  runApp(MyApp());

  // cd lib\Server\appserver
  // python manage.py runserver 5455
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Color(0xfff9f9f9), // status bar color
    statusBarBrightness: Brightness.light,//status bar brigtness
    statusBarIconBrightness:Brightness.light , //status barIcon Brightness
    // systemNavigationBarDividerColor: Colors.greenAccent,//Navigation bar divider color
    // systemNavigationBarIconBrightness: Brightness.light, //navigation bar icon 
  ));
    // FlutterStatusbarcolor.setStatusBarColor(Color(0xfff9f9f9));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InitialLoginHome(),
      theme: basicTheme(),
      routes: <String, WidgetBuilder>{
        '/profile': (BuildContext context) => new ProfilePage(),
      },
    );
  }
}
