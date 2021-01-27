import 'package:dutchmenserve/Presentation/OrganizationsPage.dart';
import 'package:dutchmenserve/Presentation/ProfilePage.dart';
import 'package:dutchmenserve/Presentation/app_icons.dart';
import 'package:dutchmenserve/Presentation/ig_icon.dart';
import 'package:flutter/material.dart';

class ConnectWUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            // Container(
            //   margin: EdgeInsets.only(top: 10, left: 14),
            //   child: ListTile(
            //     contentPadding: EdgeInsets.symmetric(horizontal: 25),
            //     title: Text(
            //       'Account',
            //       textAlign: TextAlign.start,
            //       style: TextStyle(
            //           fontWeight: FontWeight.w600, color: Colors.grey[700]),
            //     ),
            //   ),
            // ),

            //TODO: social media links (FB and IG, LVC website)

            Card(
              margin: EdgeInsets.only(bottom: 1, top: 20),
              elevation: 3,
              child: ListTile(
                  tileColor: Colors.white,
                  leading: Icon(Icons.person, size: 30),
                  title: Text('Profile'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  }),
            ),
            Card(
              margin: EdgeInsets.only(bottom: 1),
              elevation: 3,
              child: ListTile(
                  tileColor: Colors.white,
                  leading: Icon(Icons.group_work, size: 30),
                  title: Text('Service Organizations'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrganizationsPage()),
                    );
                  }),
            ),
            Card(
              margin: EdgeInsets.only(bottom: 10),
              elevation: 3,
              child: ListTile(
                tileColor: Colors.white,
                leading: Icon(Icons.assignment_ind, size: 30),
                title: Text('Jennifer Liedtka'),
                subtitle: Text(
                    'Service and Volunteerism Coordinator\nliedtka@lvc.edu    (717) 867-6167',
                    style: TextStyle(fontSize: 13)),
                isThreeLine: true,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent, width: 2),
                    color: Color(0xff2e85f3),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[400],
                        offset: Offset(0.0, 2.0), //(x,y)
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: IconButton(
                    padding: EdgeInsets.only(right: 32, top: .2),
                    icon: Icon(AppIcons.fb, size: 59, color: Colors.white),
                    onPressed: () {
                      // TODO: link to FB
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent, width: 2),
                    gradient: RadialGradient(
                        center: Alignment(-.7, 1.9),
                        focal: Alignment(1, 1.8),
                        focalRadius: 1.7,
                        colors: [
                          Colors.indigoAccent,
                          Colors.purple[400],
                          Colors.pinkAccent,
                          Colors.orange[300],
                          Colors.yellow[200]
                        ],
                        stops: [
                          .2,
                          .4,
                          .7,
                          .9,
                          .99
                        ]),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[400],
                        offset: Offset(0.0, 2.0), //(x,y)
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: IconButton(
                    padding: EdgeInsets.only(left: 1, top: 1),
                    icon: Icon(IGicon.instagram, size: 39, color: Colors.white),
                    onPressed: () {
                      // TODO: link to IG
                    },
                  ),
                ),
              ],
            ),

            Card(
              margin: EdgeInsets.only(bottom: 1, top: 5),
              elevation: 3,
              child: ListTile(
                  tileColor: Colors.white,
                  leading: Icon(Icons.settings, size: 30),
                  title: Text('Settings'),
                  onTap: () {
                    //TODO: Settings page?
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => EditSettings()),
                    // );
                  }),
            ),
            Card(
              margin: EdgeInsets.only(bottom: 1),
              elevation: 3,
              child: ListTile(
                  tileColor: Colors.white,
                  leading: Icon(Icons.info_outline, size: 30),
                  title: Text('About'),
                  onTap: () {
                    //TODO: about page?
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => About()),
                    // );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
