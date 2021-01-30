import 'dart:ui';

import 'package:dutchmenserve/Presentation/EventsList.dart';
import 'package:dutchmenserve/Presentation/NotificationsPage.dart';
import 'package:dutchmenserve/Presentation/OrganizationsPage.dart';
import 'package:dutchmenserve/Presentation/VolunteerPage.dart';
import 'package:dutchmenserve/Presentation/ReportHoursPage.dart';
import 'package:dutchmenserve/Presentation/connectWUsPage.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  final User user;
  const HomePage(this.user);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xff002A4E),
      systemNavigationBarColor: Color(0xfff9f9f9),
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          // centerTitle: true,
          title: Text(
            'Dutchmen Serve',
            style: TextStyle(
                fontFamily: 'BebasNeue',
                color: Color(0xff95C1DC),
                fontSize: 45),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.notifications, size: 28),
                padding: EdgeInsets.only(right: 15),
                onPressed: () {
                  // Navigator.of(context).pushNamed('/notifications-page');
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => NotificationsPage()),
                  );
                }),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Volunteer',
                icon: Icon(
                  Icons.pan_tool,
                  // size: 20,
                ),
                iconMargin: EdgeInsets.only(bottom: 3, right: 6),
              ),
              Tab(
                text: 'Report',
                icon: Icon(Icons.event_note),
                iconMargin: EdgeInsets.only(bottom: 2),
              ),
              Tab(
                text: 'Connect',
                icon: Icon(Icons.people),
                iconMargin: EdgeInsets.only(bottom: 0),
              ),
            ],
          ),
        ),
        // drawer: createD(context),
        body: TabBarView(
          children: [
            VolunteerPage(),
            ReportHoursPage(),
            ConnectWUsPage(user),
          ],
        ),
      ),
    );
  }

  // drawer
  Widget createD(BuildContext context) {
    return Drawer(
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
                new MaterialPageRoute(builder: (context) => EventsList(user)),
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
                      builder: (context) => ConnectWUsPage(user)));
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
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => VolunteerPage()));
            },
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  // original home
  Widget createOG() {
    return Column(
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
