import 'package:dutchmenserve/Presentation/OrganizationsPage.dart';
import 'package:dutchmenserve/Presentation/ProfilePage.dart';
import 'package:dutchmenserve/Presentation/aboutPage.dart';
import 'package:dutchmenserve/Presentation/app_icons.dart';
import 'package:dutchmenserve/Presentation/ig_icon.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConnectWUsPage extends StatelessWidget {
  final User user;
  ConnectWUsPage(this.user);

  final List<BoxShadow> _boxShadow = [
    BoxShadow(
      color: Colors.grey[400],
      offset: Offset(0.0, 2.0), //(x,y)
      blurRadius: 5,
    )
  ];

  final Gradient _igGradient = RadialGradient(
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
      ]);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xfff9f9f9),
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent, width: 2),
                    color: Color(0xff2e85f3),
                    shape: BoxShape.circle,
                    boxShadow: _boxShadow,
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
                    shape: BoxShape.circle,
                    boxShadow: _boxShadow,
                    gradient: _igGradient,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.only(left: 1, top: 1),
                    icon: Icon(IGicon.instagram, size: 39, color: Colors.white),
                    onPressed: () {
                      // TODO: link to IG
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    color: Color(0xff002A4E),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    boxShadow: _boxShadow,
                  ),
                  child: IconButton(
                    onPressed: () {
                      //TODO: link to LVC website
                    },
                    padding: EdgeInsets.all(0.0),
                    icon: Image(image: AssetImage('images/logo_circle.png')),
                  ),
                ),
              ],
            ),
            Card(
              margin: EdgeInsets.only(bottom: 1),
              elevation: 3,
              child: ListTile(
                  tileColor: Colors.white,
                  leading:
                      Icon(Icons.person, size: 30, color: Colors.grey[400]),
                  title: Text(user.firstName + ' ' + user.lastName),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfilePage(user: user)),
                    );
                  }),
            ),
            Card(
              margin: EdgeInsets.only(bottom: 1),
              elevation: 3,
              child: ListTile(
                  tileColor: Colors.white,
                  leading:
                      Icon(Icons.group_work, size: 30, color: Colors.grey[400]),
                  title: Text('Service Organizations'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrganizationsPage(user: user)),
                    );
                  }),
            ),
            Card(
              margin: EdgeInsets.only(bottom: 10),
              elevation: 3,
              child: ListTile(
                tileColor: Colors.white,
                leading: Icon(Icons.assignment_ind,
                    size: 30, color: Colors.grey[400]),
                title: Text('Jennifer Liedtka'),
                subtitle: Text(
                    'Service and Volunteerism Coordinator\nliedtka@lvc.edu    (717) 867-6167',
                    style: TextStyle(fontSize: 13)),
                isThreeLine: true,
              ),
            ),
            Card(
              margin: EdgeInsets.only(bottom: 1, top: 10),
              elevation: 3,
              child: ListTile(
                  tileColor: Colors.white,
                  leading:
                      Icon(Icons.settings, size: 30, color: Colors.grey[400]),
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
                  leading: Icon(Icons.info_outline,
                      size: 30, color: Colors.grey[400]),
                  title: Text('About'),
                  onTap: () {
                    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                      statusBarColor: Color(0xff001d35),
                      systemNavigationBarColor: Color(0xff002A4E),
                      systemNavigationBarIconBrightness: Brightness.light,
                    ));
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutPage()),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
