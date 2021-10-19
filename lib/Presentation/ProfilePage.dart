import 'dart:ui';

import 'package:dutchmenserve/Infrastructure/cubit/users_cubit.dart';
import 'package:dutchmenserve/Presentation/Constants.dart';
import 'package:dutchmenserve/models/interest.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';

import 'interestSelection.dart';

/*
This class builds the profile page for the user,
shows image (optional), name, email, interests, organizations followed.

Other users can see this profile.

TODO: does this have to be stateful??
*/

class ProfilePage extends StatelessWidget {
  final User user;
  ProfilePage({Key key, this.user}) : super(key: key);

  final ScrollController _scrollController = ScrollController();
  final colors = Constants().colors;
  final interests = Constants().interests;
  final icons = Constants().icons;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        // ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 30, right: 30, left: 30),
          child: Column(
            children: [
              Center(child: Icon(Icons.account_circle, size: 120)),
              BlocBuilder<UsersCubit, UsersState>(builder: (context, state) {
                if (state is LoadedState) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      state.users[0].firstName + ' ' + state.users[0].lastName,
                      // user.firstName + ' ' + user.lastName,
                      style: TextStyle(fontSize: 24),
                    ),
                  );
                } else {
                  //TODO needs loading state and return to home state if no user is found
                  return Container();
                }
              }),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    BlocBuilder<UsersCubit, UsersState>(
                        builder: (context, state) {
                      if (state is LoadedState) {
                        return ListTile(
                          leading: Icon(Icons.email),
                          title: Text(
                            state.users[0].emailAddress,
                            // style: TextStyle(fontSize: 16),
                          ),
                        );
                      } else {
                        //TODO needs loading state and return to home state if no user is found
                        return Container();
                      }
                    }),
                    Divider(height: 8),
                    InkWell(
                      child: ListTile(
                        title: Text('Interests:'),
                        leading: Icon(Icons.favorite),
                        trailing: Icon(Icons.edit),
                        subtitle: Container(
                            margin: EdgeInsets.only(top: 4),
                            child: SizedBox(
                                height: 36,
                                child: BlocBuilder<UsersCubit, UsersState>(
                                    builder: (context, state) {
                                  if (state is LoadedState) {
                                    List<Widget> widgets = List.generate(
                                      state.users[0].interests.length,
                                      (index) => CircleAvatar(
                                        backgroundColor: colors[
                                            state.users[0].interests[index]],
                                        child: IconButton(
                                          tooltip: interests[state
                                                  .users[0].interests[index]]
                                              .interest,
                                          padding: EdgeInsets.zero,
                                          icon: Icon(
                                            icons[state
                                                .users[0].interests[index]],
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
                                  } else {
                                    //TODO needs loading state and return to home state if no user is found
                                    return Text("test");
                                  }
                                }))),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (contextInterests) => BlocProvider.value(
                                    value: context.read<UsersCubit>(),
                                    //TODO change selectinterests so that it is passed nothing and gets user from context
                                    child: SelectInterests(user: user),
                                  )),
                        );
                      },
                    ),
                    Divider(
                      height: 0,
                    ),
                    ExpansionTile(
                      leading: Icon(Icons.group_work),
                      title: Text('Organizations'),
                      children: [
                        //TODO replace with user.orgs or something
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
  // Widget showInterests() {
  //   List<Widget> widgets = List.generate(
  //     10,
  //     (index) => CircleAvatar(
  //       backgroundColor: colors[index],
  //       child: IconButton(
  //         tooltip: interests[index].interest,
  //         padding: EdgeInsets.zero,
  //         icon: Icon(
  //           icons[index],
  //           color: Colors.white,
  //           size: 16,
  //         ),
  //         onPressed: () {},
  //       ),
  //     ),
  //   );

  //   return Scrollbar(
  //       // isAlwaysShown: true,
  //       thickness: 3,
  //       radius: Radius.circular(90),
  //       controller: _scrollController,
  //       child: Container(
  //         margin: EdgeInsets.only(bottom: 8),
  //         child: ListView(
  //             shrinkWrap: true,
  //             controller: _scrollController,
  //             scrollDirection: Axis.horizontal,
  //             children: widgets),
  //       ));
  // }
  Widget showInterests(BuildContext context) {
    BlocBuilder<UsersCubit, UsersState>(builder: (context, state) {
      if (state is LoadedState) {
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
      } else {
        //TODO needs loading state and return to home state if no user is found
        return Text("test");
      }
    });
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
