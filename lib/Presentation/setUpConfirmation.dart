import 'package:flutter/material.dart';

import 'homePage.dart';
import 'profilePage.dart';

// ignore: camel_case_types
class registrationConfirm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => HomePage()));
          },
          label: Text('Submit'),
          icon: Icon(Icons.done),
          backgroundColor: Colors.blue[800],
        ),
        body: ProfilePage());
  }
}
