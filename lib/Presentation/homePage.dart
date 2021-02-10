import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dutchmenserve/Presentation/EventsList.dart';
import 'package:dutchmenserve/Presentation/NotificationsPage.dart';
import 'package:dutchmenserve/Presentation/ReportHoursPage.dart';
import 'package:dutchmenserve/Presentation/connectWUsPage.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/material.dart';
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

    // scroll so only tabs show?
    // return DefaultTabController(
    //   length: 3,
    //   child: Scaffold(
    //     body: NestedScrollView(
    //       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
    //         return <Widget>[
    //           SliverOverlapAbsorber(
    //             handle:
    //                 NestedScrollView.sliverOverlapAbsorberHandleFor(context),
    //             sliver: SliverAppBar(
    //               pinned: false,
    //               forceElevated: innerBoxIsScrolled,
    //               title: Text(
    //                 'Dutchmen Serve',
    //                 style: TextStyle(
    //                     fontFamily: 'BebasNeue',
    //                     color: Color(0xff95C1DC),
    //                     fontSize: 45),
    //               ),
    //               actions: <Widget>[
    //                 IconButton(
    //                     icon: Icon(Icons.notifications, size: 28),
    //                     padding: EdgeInsets.only(right: 15),
    //                     onPressed: () {
    //                       // Navigator.of(context).pushNamed('/notifications-page');
    //                       Navigator.push(
    //                         context,
    //                         new MaterialPageRoute(
    //                             builder: (context) => NotificationsPage()),
    //                       );
    //                     }),
    //               ],
    //               bottom: TabBar(
    //                 tabs: [
    //                   Tab(
    //                     text: 'Volunteer',
    //                     icon: Icon(
    //                       Icons.pan_tool,
    //                       // size: 20,
    //                     ),
    //                     iconMargin: EdgeInsets.only(bottom: 3, right: 6),
    //                   ),
    //                   Tab(
    //                     text: 'Report',
    //                     icon: Icon(Icons.event_note),
    //                     iconMargin: EdgeInsets.only(bottom: 2),
    //                   ),
    //                   Tab(
    //                     text: 'Connect',
    //                     icon: Icon(Icons.people),
    //                     iconMargin: EdgeInsets.only(bottom: 0),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ];
    //       },
    //       body: TabBarView(
    //         children: [
    //           EventsList(user),
    //           ReportHoursPage(user),
    //           ConnectWUsPage(user),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

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
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 60),
            child: TabBar(
              tabs: [
                Container(
                  height: 65,
                  child: Tab(
                    text: 'Volunteer',
                    icon: Icon(
                      Icons.pan_tool,
                    ),
                    iconMargin: EdgeInsets.only(bottom: 3, right: 6),
                  ),
                ),
                Container(
                  height: 65,
                  child: Tab(
                    text: 'Report',
                    icon: Icon(Icons.event_note),
                    iconMargin: EdgeInsets.only(bottom: 2),
                  ),
                ),
                Container(
                  height: 65,
                  child: Tab(
                    text: 'Connect',
                    icon: Icon(Icons.people),
                    iconMargin: EdgeInsets.only(bottom: 0),
                  ),
                ),
              ],
            ),
          ),
        ),
        // drawer: createD(context),
        body: TabBarView(
          children: [
            EventsList(user: user),
            ReportHoursPage(user),
            ConnectWUsPage(user),
          ],
        ),
      ),
    );
  }
}
