// Additional page for when reporting new hours for a group
// to allow user to check the students/organizations to include

import 'dart:convert';

import 'package:dutchmenserve/Infrastructure/cubit/users_cubit.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';

class ReportGroupAddStudents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<UsersCubit>(
        create: (BuildContext context) => UsersCubit()..getUsers(),
        child: AddStudentsStateful(),
      ),
    );
  }
}

class AddStudentsStateful extends StatefulWidget {
  AddStudentsStateful({Key key}) : super(key: key);

  @override
  _AddStudentsState createState() => _AddStudentsState();
}

class _AddStudentsState extends State<AddStudentsStateful> {
  List<User> users = [];

  _AddStudentsState({Key key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Report- Add Students'),
        backgroundColor: Colors.indigo[800],
        // automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () {
              // TODO: pass list of students to previous page, return to new report
              Navigator.pop(context, users);
            },
          )
        ],
        // leading: BackButton(
        //   onPressed: () {
        //     //TODO: popup asking if you want to lose changes
        //   },
        // ),
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is LoadedState) {
            List<Entry> data = generateData(state.users);
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) => EntryItemWidget(
                data[index],
                users,
              ),
            );
          } else {
            //TODO: make this look nicer
            return Text('Loading...');
          }
        },
      ),
    );
  }
}

class Entry {
  final String name;
  final List<Entry> members;
  User user;

  Entry(this.name, {this.members = const <Entry>[], this.user});
}

List<Entry> generateData(List<User> users) {
  List<Entry> data;
  // for (User u in users) {
  //   data.add(Entry(u.getUsername(), user: u));
  // }
  data = <Entry>[
    Entry(users[1].username, user: users[1]),
    Entry(users[1].username, user: users[1]),
    // Entry('Alpha Phi Omega', members: <Entry>[
    //   Entry(users[1].getUsername(), user: users[1]),
    //   Entry('Person 2',
    //       user: User(
    //           username: 'Person2',
    //           password: null,
    //           emailAddress: null,
    //           interests: null,
    //           org: null,
    //           events: null)),
    // ]),
    // Entry('Colleges Against Cancer', members: <Entry>[
    //   Entry('Allison Liu',
    //       user: User(
    //           username: 'ajl008',
    //           password: null,
    //           emailAddress: null,
    //           interests: null,
    //           org: null,
    //           events: null)),
    //   Entry('Mackenzie Stewart',
    //       user: User(
    //           username: 'mjs016',
    //           password: null,
    //           emailAddress: null,
    //           interests: null,
    //           org: null,
    //           events: null)),
    // ]),
  ];
  return data;
}

class EntryItemWidget extends StatefulWidget {
  EntryItemWidget(this.entry, this.users);
  final Entry entry;
  List<User> users;

  @override
  EntryItemWidgetState createState() => EntryItemWidgetState(entry, users);
}

class EntryItemWidgetState extends State<EntryItemWidget> {
  EntryItemWidgetState(this.entry, this.users);
  final Entry entry;
  List<User> users;

  Widget _buildTiles(Entry root) {
    if (root.members.isEmpty) {
      return CheckboxListTile(
        title: Text(root.name),
        onChanged: (bool newValue) {
          onUserSelected(newValue, root.user);
        },
        value: users == null ? false : users.contains(root.user),
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.name),
      leading: Checkbox(
        value: false,
        onChanged: (bool newValue) {
          //TODO: make all member checkboxes true, and add all users to users list
        },
      ),
      children: root.members.map<Widget>(_buildTiles).toList(),
    );
  }

  void onUserSelected(bool selected, User u) {
    if (selected) {
      setState(() {
        users.add(u);
      });
    } else {
      setState(() {
        users.remove(u);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
