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

class InterestEdit extends StatefulWidget {
  InterestEdit({Key key}) : super(key: key);

  @override
  _InterestEdit createState() {
    return _InterestEdit();
  }
}

class _InterestEdit extends State<InterestEdit> {
  _InterestEdit();

  final colors = Constants().colors;
  final interests = Constants().interests;
  final icons = Constants().icons;
  final fillColors = Constants().fillColors;

  List<bool> _s = List.generate(12, (index) => false);

  Color changeColor(int i) {
    if (_s[i])
      return colors[i];
    else
      return Color(0xff002A4E);
  }

  List<Column> generateWidgets() {
    return List.generate(
      10,
      (index) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Icon(
              icons[index],
              size: 40,
              semanticLabel: interests[index].interest,
              color: changeColor(index),
            ),
          ),
          Flexible(
            child: Text(
              interests[index].interest,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Flexible createGridView(List<Column> widgets) {
    return Flexible(
      child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          children: widgets.asMap().entries.map(
            (widget) {
              return Container(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      color: Color(0xffDDDDDE),
                      child: ToggleButtons(
                        selectedColor: Colors.black,
                        fillColor: fillColors[widget.key],
                        splashColor: Colors.transparent,
                        renderBorder: false,
                        constraints: BoxConstraints.expand(
                          width: constraints.maxWidth - 20,
                        ),
                        isSelected: [_s[widget.key]],
                        onPressed: (int key) {
                          // note: key stays 0 and never changes, don't use; use widget.key
                          setState(() {
                            _s[widget.key] = !_s[widget.key];
                          });
                        },
                        children: [widget.value],
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
    List<Column> w = generateWidgets();
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
                  if(state is UsersLoadedState){
                    User cUser = state.curUser;
                    return NormalButton("Save", () {
                  for (int i = 0; i < 11; i++) {
                    if (_s[i]) cUser.interests.add(i);
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