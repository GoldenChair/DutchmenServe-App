import 'dart:ui';

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);
  @override
  ProfilePageState createState() {
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //the title may be state dependant so it may be the username
          title: Text(
            'Profile',
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            )
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              child: Center(
                  child: Icon(
                Icons.account_box,
                size: 120,
              )),
            ),
            SizedBox(
              height: 40,
            ),
            //put listview here
            //collapsible

            Container(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Center(
                  child: Text(
                    'mjs016',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Container(
                  child: Text('Interests', style: TextStyle(fontSize: 30)),
                ),
                //this following row will take info form profile object
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.gavel,
                      size: 40,
                    ),
                    Icon(
                      Icons.pets,
                      size: 40,
                    ),
                    Icon(
                      Icons.color_lens,
                      size: 40,
                    ),
                    Icon(
                      Icons.child_care,
                      size: 40,
                    ),
                    Icon(
                      Icons.group,
                      size: 40,
                    ),
                    Icon(
                      Icons.computer,
                      size: 40,
                    ),
                    Icon(
                      Icons.school,
                      size: 40,
                    ),
                    Icon(
                      Icons.face,
                      size: 40,
                    ),
                    Icon(
                      Icons.more_horiz,
                      size: 40,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text('Organizations', style: TextStyle(fontSize: 30)),
            )
          ],
        ));
  }
}
