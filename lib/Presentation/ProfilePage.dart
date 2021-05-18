import 'dart:ui';

import 'package:dutchmenserve/models/interest.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/material.dart';

/*
This class builds the profile page for the user,
shows image (optional), name, email, interests, organizations followed.

Other users can see this profile.

TODO: does this have to be stateful??
*/

class ProfilePage extends StatefulWidget {
  final User user;
  ProfilePage({Key key, this.user}) : super(key: key);
  @override
  ProfilePageState createState() {
    return ProfilePageState(user);
  }
}

class ProfilePageState extends State<ProfilePage> {
  User user;
  ProfilePageState(this.user);

  final List<Interest> interests = [
    Interest('Animals', 59662, '#d81b60', '#fccde5'),
    Interest('Disabilities', 58718,'#448aff', '#80b1d3'),
    Interest('Education', 59816, '#ff6d00', '#ffffb3'),
    Interest('Food', 59429, '#cddc39', '#fdb462'),
    Interest('Health\nWellness', 59308, '#ff5252', '#fb8072'),
    Interest('Housing', 59322, '#00c853', '#b3de69'),
    Interest('Older Adults', 59162, '#7e57c2', '#bebada'),
    Interest('Service Trips', 59153, '#00897b', '#8dd3c7'),
    Interest('Veterans', 61283, '#8e24aa', '#bc80bd'),
    Interest('Other', 59526, '#546e7a', '#d9d9d9'),
  ];
  List<IconData> icons = [
    Icons.pets,
    Icons.accessible,
    Icons.school,
    Icons.local_restaurant,
    Icons.healing,
    Icons.home,
    Icons.face,
    Icons.explore,
    Icons.stars,
    Icons.more_horiz,
  ];
  List<Color> colors = [
    Colors.pink[600],
    Colors.blueAccent[200],
    Colors.orangeAccent[700],
    Colors.lime,
    Colors.redAccent,
    Colors.greenAccent[700],
    Colors.deepPurple[400],
    Colors.teal[600],
    Colors.purple[600],
    Colors.blueGrey[600],
  ];

  final ScrollController _scrollController = ScrollController();

  Widget showInterests() {
    List<Widget> widgets = List.generate(
      10,
      (index) => CircleAvatar(
        backgroundColor: colors[index],
        child: IconButton(
          tooltip: interests[index].interest,
          padding: EdgeInsets.zero,
          icon: Icon(
            icons[index],
            color: Colors.white,
            size: 16,
          ),
          onPressed: () {},
        ),
      ),
    );

    return Scrollbar(
        // isAlwaysShown: true,
        thickness: 3,
        radius: Radius.circular(90),
        controller: _scrollController,
        child: Container(
          margin: EdgeInsets.only(bottom: 8),
          child: ListView(
              shrinkWrap: true,
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              children: widgets),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          FlatButton(
            onPressed: () {
              //TODO: edit profile
            },
            child: Text(
              'EDIT',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 30, right: 30, left: 30),
          child: Column(
            children: [
              Center(child: Icon(Icons.account_circle, size: 120)),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  user.firstName + ' ' + user.lastName,
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text(
                        user.emailAddress,
                        // style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Divider(height: 8),
                    ListTile(
                      title: Text('Interests:'),
                      leading: Icon(Icons.favorite),
                      subtitle: Container(
                          margin: EdgeInsets.only(top: 4),
                          child: SizedBox(height: 36, child: showInterests())),
                    ),
                    Divider(
                      height: 0,
                    ),
                    ExpansionTile(
                      leading: Icon(Icons.group_work),
                      title: Text('Organizations'),
                      children: [
                        ListTile(
                          title: Text('org1'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

// void choiceAction(String choice, BuildContext context) {
//   setState(() {
//     if (choice == Constants.LogOut) {
//       SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//         statusBarColor: Color(0xff002A4E),
//         statusBarBrightness: Brightness.dark,
//         statusBarIconBrightness: Brightness.dark,
//         systemNavigationBarColor: Color(0xff002A4E),
//         systemNavigationBarIconBrightness: Brightness.dark,
//       ));
//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (context) => InitialLoginHome()),
//         (Route<dynamic> route) => false,
//       );
//     }
//   });
// }

// ListView buildInterestList(BuildContext context, List<bool> interests,
//     List<String> interestsNames, List<Icon> icons) {
//   return ListView.separated(
//     padding: const EdgeInsets.all(20.0),
//     itemBuilder: (BuildContext context, int index) {
//       if (interests[index]) {
//         return createLists(context, interestsNames[index], icons[index]);
//       }
//     },
//     separatorBuilder: (BuildContext context, int index) => const Divider(),
//     itemCount: interests.length,
//   );

// ExpansionTile(
//   title: Center(
//       child: Text(
//     "Interests",
//     style: TextStyle(fontSize: 18),
//   )),
//   children: [
//     ListTile(
//       leading: Icon(Icons.gavel),
//       title: Text("Advocacy & Human Rights"),
//     ),
//     ListTile(
//       leading: Icon(Icons.pets),
//       title: Text("Animals"),
//     ),
//     ListTile(
//       leading: Icon(Icons.color_lens),
//       title: Text("Arts & Culture"),
//     ),
//     ListTile(
//       leading: Icon(Icons.child_care),
//       title: Text("Children & Youth"),
//     ),
//     ListTile(
//       leading: Icon(Icons.group),
//       title: Text("Community"),
//     ),
//     ListTile(
//       leading: Icon(Icons.computer),
//       title: Text("Technology"),
//     ),
//     ListTile(
//       leading: Icon(Icons.school),
//       title: Text("Education & Literacy"),
//     ),
//     ListTile(
//       leading: Icon(Icons.face),
//       title: Text("Seniors"),
//     ),
//     ListTile(
//       leading: Icon(Icons.more_horiz),
//       title: Text("Other"),
//     )
//   ],
// );

// //List<Icon> icons in parameter?
// ListTile createLists(BuildContext context, String interestsOrNo, Icon img) {
//   //final orgCube = context.bloc<OrganizationCubit>();
//   //orgCube.getOrgs();
//   return ListTile(
//     //padding: EdgeInsets.all(25),
//     leading: img,
//     title: Text(interestsOrNo),
//   );
// }
