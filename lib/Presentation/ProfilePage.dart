import 'dart:ui';

import 'package:dutchmenserve/Constants.dart';
import 'package:flutter/material.dart';

import 'initialHomePage.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);
  @override
  ProfilePageState createState() {
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {
  //final ScrollController scrollie = ScrollController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //the title may be state dependant so it may be the username
        title: Text(
          'Profile',
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (choice) => choiceAction(choice, context),
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            child: Center(
                child: Icon(
              Icons.account_circle,
              size: 120,
            )),
          ),
          SizedBox(
            height: 40,
          ),
          //put listview here
          //collapsible
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Jen Liedtka',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Spacer(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                ),
                title: Text(
                  'liedtka@lvc.edu',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),

          ExpansionTile(
            title: Center(
                child: Text(
              "Interests",
              style: TextStyle(fontSize: 20),
            )),
            children: [
              ListTile(
                leading: Icon(Icons.gavel),
                title: Text("Advocacy & Human Rights"),
              ),
              ListTile(
                leading: Icon(Icons.pets),
                title: Text("Animals"),
              ),
              ListTile(
                leading: Icon(Icons.color_lens),
                title: Text("Arts & Culture"),
              ),
              ListTile(
                leading: Icon(Icons.child_care),
                title: Text("Children & Youth"),
              ),
              ListTile(
                leading: Icon(Icons.group),
                title: Text("Community"),
              ),
              ListTile(
                leading: Icon(Icons.computer),
                title: Text("Technology"),
              ),
              ListTile(
                leading: Icon(Icons.school),
                title: Text("Education & Literacy"),
              ),
              ListTile(
                leading: Icon(Icons.face),
                title: Text("Seniors"),
              ),
              ListTile(
                leading: Icon(Icons.more_horiz),
                title: Text("Other"),
              )
            ],
          ),
          ExpansionTile(
            title: Center(
                child: Text(
              'Organizations',
              style: TextStyle(fontSize: 20),
            )),
            children: [
              ListTile(
                title: Text('org1'),
              ),
            ],
          )
        ],
      ),
    );
  }

  void choiceAction(String choice, BuildContext context) {
    setState(() {
      if (choice == Constants.LogOut) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InitialLoginHome()),
        );
      }
    });
  }
}
