import 'dart:ui';

import 'package:dutchmenserve/Presentation/NotificationsPage.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'EventsList.dart';
import 'OrganizationsPage.dart';
import 'RegisteredPage.dart';
import 'ReportHoursPage.dart';
import 'connectWUsPage.dart';
import 'NotificationsPage.dart';

//Add to drawer "Your registed events" and your favorite events or add a bottom bar

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Center(
            child: Text(
          'Dutchmen Serve',
          style: TextStyle(fontFamily: 'BebasNeue', fontSize: 40),
        )),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20),

            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => NotificationsPage()),
                );
              },
              child: (Icon(
                Icons.notifications,
                size: 40,
                color: Colors.white,
              )),
            ),
            // onPressed: () {
            //   Navigator.push(
            //     context,
            //     new MaterialPageRoute(
            //         builder: (context) => NotificationsPage()),
            //   );
            // },
          )
        ],
      ),
      // /* bottomNavigationBar: BottomNavigationBar(items: [
      //   BottomNavigationBarItem(
      //       icon: new Icon(Icons.pan_tool),
      //       title: new Text('Your Registered Events')),
      //   BottomNavigationBarItem(
      //       icon: new Icon(Icons.favorite),
      //       title: new Text('Your Favorite Events'))
      // ]),*/
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 100,
              child: DrawerHeader(
                  child: Row(
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 50,
                  ),
                  SizedBox(width: 25),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/profile');
                      //Navigator.push(
                      //context,
                      //new MaterialPageRoute(
                      //builder: (context) => ProfilePage()));
                    },
                    child: Text(
                      'Profile',
                      style: TextStyle(fontFamily: 'BebasNeue', fontSize: 35),
                    ),
                  ),
                ],
              )),
            ),
            //drawers were orig encased in gesture dectector
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text(
                'Service Events',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => EventsList()),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text(
                'Report Hours',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => ReportHoursPage()));
              },
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text(
                'Organizations',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => OrganizationsPage()));
              },
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text(
                'Connect with Us',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => ConnectWUsPage()));
              },
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(Icons.pan_tool),
              title: Text(
                'Registered Events',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => RegisteredPage()));
              },
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      body: Column(
        //have row and then put in the column
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Spacer(),
          createExpanded(
            'We empower students for a life of citizenship both in our community and around the globe.',
            Icons.public,
            10,
          ),
          Spacer(),
          createExpanded(
            'Students may enhance their self-knowledge as they examine their own identity and purpose in the context of a diverse world in which a variety of needs and injustices exist.',
            Icons.people,
            40,
          ),
          Spacer(),
          createExpanded(
            'Students may grow their awareness and knowledge regarding needs and justice issues in a variety of areas.',
            Icons.gavel,
            70,
          ),
          Spacer(),
        ],
      ),
    );
  }

  // function to create rounded text expandable
  Expanded createExpanded(String s, IconData iconData, double margin) {
    return Expanded(
      flex: 3,
      child: Container(
        margin: EdgeInsets.only(right: margin),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(70.0),
            bottomRight: Radius.circular(70.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(),
            Flexible(
              flex: 8,
              child: Icon(
                iconData,
                size: 50,
                color: Colors.black,
              ),
            ),
            Spacer(),
            Flexible(
              flex: 25,
              // child: Padding(
              //   padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              //   child: Text(
              //     s,
              //     style: TextStyle(fontFamily: 'KiteOne', fontSize: 14),
              //   ),
              // ),
              child: AutoSizeText(
                s,
                style: TextStyle(fontFamily: 'KiteOne', fontSize: 16),
                maxLines: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
