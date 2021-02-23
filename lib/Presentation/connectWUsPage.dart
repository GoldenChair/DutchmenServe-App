import 'package:dutchmenserve/Presentation/OrganizationsPage.dart';
import 'package:dutchmenserve/Presentation/ProfilePage.dart';
import 'package:dutchmenserve/Presentation/aboutPage.dart';
import 'package:dutchmenserve/Presentation/initialHomePage.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConnectWUsPage extends StatelessWidget {
  final User user;
  ConnectWUsPage(this.user);

  final List<BoxShadow> _boxShadow = [
    BoxShadow(
      color: Colors.grey[400],
      offset: const Offset(0.0, 2.0), //(x,y)
      blurRadius: 5,
    )
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: const Color(0xfff9f9f9),
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.only(bottom: 1, top: 20),
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
              margin: const EdgeInsets.only(bottom: 1),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(12, 12)),
                    boxShadow: _boxShadow,
                  ),
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: Image(image: AssetImage('images/fb_icon.png')),
                    onPressed: () {
                      // TODO: link to FB
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(11, 11)),
                    boxShadow: _boxShadow,
                  ),
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: Image(image: AssetImage('images/ig_icon.png')),
                    onPressed: () {
                      // TODO: link to IG
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: const Color(0xff002A4E),
                    shape: BoxShape.rectangle,
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(11, 11)),
                    boxShadow: _boxShadow,
                  ),
                  child: IconButton(
                    onPressed: () {
                      //TODO: link to LVC website
                    },
                    padding: const EdgeInsets.all(0.0),
                    icon: Image(image: AssetImage('images/logo_circle.png')),
                  ),
                ),
              ],
            ),
            Card(
              margin: const EdgeInsets.only(bottom: 1),
              elevation: 3,
              child: ListTile(
                  tileColor: Colors.white,
                  leading:
                      Icon(Icons.person, size: 30, color: Colors.grey[400]),
                  title: Text('Profile'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfilePage(user: user)),
                    );
                  }),
            ),
            Card(
              margin: const EdgeInsets.only(bottom: 1),
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
              margin: const EdgeInsets.only(bottom: 1),
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
            Card(
              margin: const EdgeInsets.only(bottom: 1),
              elevation: 3,
              child: ListTile(
                tileColor: Colors.white,
                leading: Icon(Icons.logout, size: 30, color: Colors.grey[400]),
                title: Text('Logout',
                    style: TextStyle(
                        color: const Color(0xffA02A2C),
                        fontWeight: FontWeight.w600)),
                onTap: () {
                  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                    statusBarColor: const Color(0xff002A4E),
                    statusBarBrightness: Brightness.dark,
                    statusBarIconBrightness: Brightness.dark,
                    systemNavigationBarColor: const Color(0xffFFE400),
                    systemNavigationBarIconBrightness: Brightness.dark,
                  ));
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => InitialLoginHome()),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ),
            SizedBox(height: 30),
            Divider(indent: 50, endIndent: 50),
            Center(
                child: Text(
              'CDS Department',
              style: TextStyle(color: Colors.grey),
            )),
            Divider(indent: 50, endIndent: 50),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
