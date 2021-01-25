import 'dart:ui';

import 'package:dutchmenserve/Presentation/Constants.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'initialHomePage.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);
  @override
  ProfilePageState createState() {
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {
  User me = new User(
    'Mackenzie',
    'Stewart',
    'mjs016',
    'pw',
  );
  List<Icon> iconList = [
    Icon(Icons.gavel),
    Icon(Icons.pets),
    Icon(Icons.color_lens),
    Icon(Icons.child_care),
    Icon(Icons.group),
    Icon(Icons.group),
    Icon(Icons.school),
    Icon(Icons.face),
    Icon(Icons.more_horiz)
  ];
  List<bool> interests = [
    false,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ];
  List<String> interestsTitles = [
    "Advocacy & Human Rights",
    "Animals",
    "Arts & Culture",
    "Children & Youth",
    "Community",
    "Technology",
    "Education & Literacy",
    "Seniors",
    "Other"
  ];

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
                title: Row(
                  children: [
                    Text(
                      me.firstName,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      me.lastName,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
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
                  me.emailAddress,
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
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Color(0xff002A4E),
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Color(0xff002A4E),
          systemNavigationBarIconBrightness: Brightness.dark,
        ));
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => InitialLoginHome()),
          (Route<dynamic> route) => false,
        );
      }
    });
  }
}

ListView buildInterestList(BuildContext context, List<bool> interests,
    List<String> interestsNames, List<Icon> icons) {
  return ListView.separated(
    padding: const EdgeInsets.all(20.0),
    itemBuilder: (BuildContext context, int index) {
      if (interests[index]) {
        return createLists(context, interestsNames[index], icons[index]);
      }
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(),
    itemCount: interests.length,
  );
}

//List<Icon> icons in parameter?
ListTile createLists(BuildContext context, String interestsOrNo, Icon img) {
  //final orgCube = context.bloc<OrganizationCubit>();
  //orgCube.getOrgs();
  return ListTile(
    //padding: EdgeInsets.all(25),
    leading: img,
    title: Text(interestsOrNo),
  );
}
