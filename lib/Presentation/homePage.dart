import 'package:flutter/material.dart';

import 'EventsList.dart';
import 'NotificationsList.dart';
import 'OrganizationsPage.dart';
import 'ReportHoursPage.dart';

class HomePage extends StatelessWidget {
  double labelHeight = 60;
  double labelWidth = 150;

  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dutchmen Serve"),
        backgroundColor: Colors.indigo[800],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                ctxt,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text('HOMEPAGE'),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Events'),
              onTap: () {
                Navigator.push(
                  ctxt,
                  MaterialPageRoute(builder: (context) => OppsCards()),
                );
              },
            ),
            ListTile(
              title: Text('Report Hours'),
              onTap: () {
                Navigator.push(
                  ctxt,
                  MaterialPageRoute(builder: (context) => ReportHoursPage()),
                );
              },
            ),
            ListTile(
              title: Text('Organizations'),
              onTap: () {
                Navigator.push(
                  ctxt,
                  MaterialPageRoute(builder: (context) => OrganizationsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
