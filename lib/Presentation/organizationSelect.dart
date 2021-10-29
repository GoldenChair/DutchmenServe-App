import 'dart:ui';
import 'package:dutchmenserve/Infrastructure/cubit/users_cubit.dart';
import 'package:dutchmenserve/Presentation/widgets.dart';
import 'package:dutchmenserve/Presentation/homePage.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:dutchmenserve/models/organization.dart';
import 'package:dutchmenserve/Infrastructure/cubit/organization_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
Scrollable checklist for user to select the orgnizations they are interested in, 
want to follow to see events that this service organization does.

Offers option to set up later.
*/

class SetUpOrgPage extends StatefulWidget {
  SetUpOrgPage({Key key}) : super(key: key);
  @override
  SetUpOrgState createState() {
    return SetUpOrgState();
  }
}

class SetUpOrgState extends State<SetUpOrgPage> {
  SetUpOrgState();

  // final List<String> entries = <String>[
  //   'Alpha Phi Omega',
  //   'B',
  //   'C',
  //   'D',
  //   'E',
  //   'F',
  //   'G',
  //   'H',
  //   'I',
  //   'J',
  //   'K',
  //   'L',
  //   'M'
  // ];
  List<String> getEntries(List<Organization> orgs) {
    List<String> entries = [];
    for (var i = 0; i < orgs.length; i++) {
      String name = orgs[i].getOrgName();
      entries.add(name);
    }
    return entries;
  }

  // 13 is a hardcoded number
  List<bool> _isChecked = List.generate(13, (index) => false);

  void sendToCubit() {
    // tell user cubit to add user
  }

  void next() {
    sendToCubit();
    User user = null;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xff002A4E),
      systemNavigationBarColor: Color(0xfff9f9f9),
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(user),
      ),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Select your organizations')),
        body: Column(
          children: [
            new Expanded(
              child: BlocBuilder<OrganizationCubit, OrganizationState>(
                  builder: (context, state) {
                if (state is OrgLoadedState) {
                  List<String> entries = getEntries(state.orgs);
                  return ListView.separated(
                    padding: const EdgeInsets.all(20.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.black),
                            color: Colors.white,
                          ),
                          child: CheckboxListTile(
                              title: Text('${entries[index]}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  )),
                              activeColor: Color(0xff006ecc),
                              value: _isChecked[index],
                              onChanged: (value) {
                                setState(() {
                                  _isChecked[index] = !_isChecked[index];
                                });
                              }));
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(color: Colors.blueGrey),
                    itemCount: entries.length,
                  );
                } else {
                  return Text("test");
                }
              }),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: BlocBuilder<OrganizationCubit, OrganizationState>(
                  builder: (context, stateOrg) {
                if (stateOrg is OrgLoadedState) {
                  List<String> entries = getEntries(stateOrg.orgs);
                  return BlocBuilder<UsersCubit, UsersState>(
                      builder: (context, state) {
                    if (state is UsersLoadedState) {
                      return NormalButton(
                        'Next',
                        () {
                          List<int> orgs = [];
                          for (int i = 0; i < entries.length; i++) {
                            if (_isChecked[i]) orgs.add(i);
                          }
                          state.curUser.organizations = orgs;
                          editUser(context, state.curUser);
                          next();
                        },
                      );
                    } else {
                      return Text("error");
                    }
                  });
                } else {
                  return Text("test");
                }
              }),
            ),
            TextButton(
              child: Text(
                'Set up later',
                style: TextStyle(
                  color: Color(0xff002A4E),
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                next();
              },
            ),
          ],
        ));
  }

  void editUser(BuildContext context, User user) {
    final usersCubit = context.read<UsersCubit>();
    usersCubit.editUser(user);
  }
}
