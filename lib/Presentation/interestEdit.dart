import 'dart:ui';
import 'package:dutchmenserve/Infrastructure/cubit/users_cubit.dart';
import 'package:dutchmenserve/Presentation/ProfilePage.dart';
import 'package:dutchmenserve/Presentation/widgets.dart';
import 'package:dutchmenserve/Presentation/organizationSelect.dart';
import 'package:dutchmenserve/models/interest.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/Constants.dart';

/*
Page to edit interests for profile page
 */

//TODO: Highlight interests user is already in

class Pair<T1, T2> {
  final T1 interest;
  final T2 widget;

  Pair(this.interest, this.widget);
}

class InterestEdit extends StatefulWidget {
  InterestEdit({Key key}) : super(key: key);

  @override
  _InterestEdit createState() {
    return _InterestEdit();
  }
}

class _InterestEdit extends State<InterestEdit> {
  _InterestEdit();

  //final colors = Constants().colors;
  final interests = Constants().interestsMap;
  //final icons = Constants().icons;
  //final fillColors = Constants().fillColors;

  // List<bool> _s = List.generate(12, (index) => false);
  var _selected = Map<String, bool>.fromIterable(
      Constants().interestsMap.keys.toList(),
      key: (item) => item,
      value: (item) => false);

  Color changeColor(String interest) {
    if (_selected[interest])
      return interests[interest].color;
    else
      return Color(0xff002A4E);
  }

  List<Pair<String, Column>> generateWidgets() {
    return interests.entries.map((entry) => Pair<String, Column>(
          entry.key,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Icon(
                  entry.value.icon,
                  size: 40,
                  semanticLabel: entry.value.interest,
                  color: changeColor(entry.value.interest),
                ),
              ),
              Flexible(
                child: Text(
                  entry.value.interest,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Flexible createGridView(List<Pair<String, Column>> widgets) {
    return Flexible(
      child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: (interests.length + 1) / 2,
          children: widgets.asMap().entries.map(
            (pair) {
              return Container(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      color: Color(0xffDDDDDE),
                      child: ToggleButtons(
                        selectedColor: Colors.black,
                        fillColor: interests[pair.value.interest].fillColor,
                        splashColor: Colors.transparent,
                        renderBorder: false,
                        constraints: BoxConstraints.expand(
                          width: constraints.maxWidth - 20,
                        ),
                        isSelected: [_selected[pair.value.interest]],
                        onPressed: (int key) {
                          // note: key stays 0 and never changes, don't use; use widget.key
                          setState(() {
                            _selected[pair.value.interest] =
                                !_selected[pair.value.interest];
                          });
                        },
                        children: [pair.value.widget],
                      ),
                    );
                  },
                ),
              );
            },
          ).toList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Pair<String, Column>> w = generateWidgets();
    return Scaffold(
      appBar: AppBar(title: Text('Select your interests')),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: Row(
                children: [
                  Flexible(child: Container()),
                  Flexible(
                    flex: 16,
                    child: Column(
                      children: <Widget>[
                        createGridView(w),
                      ],
                    ),
                  ),
                  Flexible(child: Container()),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 5),
              child: BlocBuilder<UsersCubit, UsersState>(
                builder: (context, state) {
                  if (state is UsersLoadedState) {
                    User cUser = state.curUser;
                    return NormalButton("Save", () {
                      cUser.interests = [];
                      for (var item in _selected.entries) {
                        if (item.value) {
                          cUser.interests.add(item.key);
                        }
                      }
                      editUser(context, cUser);
                      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                        statusBarColor: Color(0xff002A4E),
                        systemNavigationBarColor: Color(0xfff9f9f9),
                        systemNavigationBarIconBrightness: Brightness.dark,
                      ));
                      Navigator.pop(context);
                    });
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void editUser(BuildContext context, User user) {
  final usersCubit = context.read<UsersCubit>();
  usersCubit.editUser(user);
}
