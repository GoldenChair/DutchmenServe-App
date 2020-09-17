import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';
import 'profilePage.dart';

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