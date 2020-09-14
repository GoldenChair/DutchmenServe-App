import 'dart:ui';

import 'package:flutter/material.dart';

import 'FavoritedPage.dart';
import 'OrganizationsPage.dart';
import 'RegisteredPage.dart';
import 'connectWUsPage.dart';


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
      ),
      /* bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: new Icon(Icons.pan_tool),
            title: new Text('Your Registered Events')),
        BottomNavigationBarItem(
            icon: new Icon(Icons.favorite),
            title: new Text('Your Favorite Events'))
      ]),*/
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
              /* onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => EventsList()));
              },*/
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(Icons.create),
              title: Text(
                'Report Hours',
                style: TextStyle(fontSize: 20),
              ),
              /*onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => ReportHoursPage()));
              },*/
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
                'Your Registered Events',
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
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text(
                'Your Favorited Events',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => FavoritedPage()));
              },
            )
          ],
        ),
      ),
      body: Column(
        //have row and then put in the column
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(70.0),
                      bottomRight: Radius.circular(70.0))),
              height: 130,
              width: 400,
              //color: Colors.teal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.public,
                    size: 50,
                    color: Colors.black,
                  ),
                  SizedBox(width: 20),
                  Flexible(
                      child: Text(
                    'We empower students for a life of citizenship both in our community and around the globe',
                    style: TextStyle(fontFamily: 'KiteOne', fontSize: 20),
                  ))
                ],
              )),
          SizedBox(
            height: 35,
          ),
          Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(70),
                      bottomRight: Radius.circular(70))),
              height: 130,
              width: 350,
              //color: Colors.teal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.people,
                    size: 50,
                    color: Colors.black,
                  ),
                  SizedBox(width: 20),
                  Flexible(
                      child: Text(
                    'Students may enhance their self-knowledge as they examine their own identity and purpose in the context of a diverse world in which a variety of needs and injustices exist',
                    style: TextStyle(fontFamily: 'KiteOne', fontSize: 15),
                  ))
                ],
              )),
          SizedBox(
            height: 35,
          ),
          Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(70.0),
                      bottomRight: Radius.circular(70.0))),
              height: 130,
              width: 300,
              //color: Colors.teal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.gavel,
                    size: 45,
                    color: Colors.black,
                  ),
                  SizedBox(width: 20),
                  Flexible(
                      child: Text(
                    'Students may grow their awareness and knowledge regarding needs and justice issues in a variety of areas',
                    style: TextStyle(fontFamily: 'KiteOne', fontSize: 14),
                  ))
                ],
              )),
        ],
      ),
    );
  }
}
