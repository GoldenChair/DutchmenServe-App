import 'package:dutchmenserve/Infrastructure/eventsRepository.dart';
import 'package:dutchmenserve/Presentation/initialHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Infrastructure/cubit/event_cubit.dart';
import 'Presentation/ProfilePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => EventsCubit(FakeEventsRepository()),
        child: InitialLoginHome(),
      ),
      routes: <String, WidgetBuilder>{
        '/profile': (BuildContext context) => new ProfilePage(),
      },
    );
  }
}
