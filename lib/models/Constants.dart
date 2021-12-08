import 'dart:ui';
import 'dart:collection';
import 'package:dutchmenserve/models/interest.dart';
import 'package:flutter/material.dart';

/*
This class defines constants.
Currently unused. 
Consider use for future refactoring.
*/ 
class Constants {
  static const double padding = 10;
  static const double avatarRadius = 45;

  final interestsMap = {"Animals": Interest('Animals', Icons.pets,  Colors.pink[600], Colors.pink[100]),
                'Disabilities': Interest('Disabilities', Icons.accessible, Colors.blueAccent[200], Colors.blue[100]),
                'Education': Interest('Education', Icons.school,  Colors.orangeAccent[700], Colors.orange[100]),
                'Food': Interest('Food', Icons.local_restaurant, Colors.lime, Colors.lime[100]),
                'Health\nWellness': Interest('Health\nWellness', Icons.healing, Colors.redAccent, Colors.red[100]),
                'Housing' : Interest('Housing', Icons.home, Colors.greenAccent[700], Colors.green[100]),
                'Older Adults' : Interest('Older Adults', Icons.face, Colors.deepPurple[400], Colors.deepPurple[100]),
                'Service Trips' : Interest('Service Trips', Icons.explore, Colors.teal[600], Colors.teal[100]),
                'Veterans' : Interest('Veterans', Icons.stars, Colors.purple[600], Colors.purple[100]),
                'Other' : Interest('Other', Icons.more_horiz, Colors.blueGrey[600], Colors.blueGrey[100]),
                };

  // final List<Interest> interests = [
  //   Interest('Animals', 59662, '#d81b60', '#fccde5'),
  //   Interest('Disabilities', 58718, '#448aff', '#80b1d3'),
  //   Interest('Education', 59816, '#ff6d00', '#ffffb3'),
  //   Interest('Food', 59429, '#cddc39', '#fdb462'),
  //   Interest('Health\nWellness', 59308, '#ff5252', '#fb8072'),
  //   Interest('Housing', 59322, '#00c853', '#b3de69'),
  //   Interest('Older Adults', 59162, '#7e57c2', '#bebada'),
  //   Interest('Service Trips', 59153, '#00897b', '#8dd3c7'),
  //   Interest('Veterans', 61283, '#8e24aa', '#bc80bd'),
  //   Interest('Other', 59526, '#546e7a', '#d9d9d9'),
  // ];

  // // index colors by interest id
  // final List<Color> colors = [
  //   Colors.pink[600], //#d81b60
  //   Colors.blueAccent[200], //#448aff
  //   Colors.orangeAccent[700], //#ff6d00
  //   Colors.lime, //#cddc39
  //   Colors.redAccent, //#ff5252
  //   Colors.greenAccent[700], //#00c853
  //   Colors.deepPurple[400], //#7e57c2
  //   Colors.teal[600], //#00897b
  //   Colors.purple[600], //#8e24aa
  //   Colors.blueGrey[600], //#546e7a
  // ];

  // final List<Color> fillColors = [
  //   Colors.pink[100], //Color(0xfffccde5), //#fccde5
  //   Colors.blue[100], //Color(0xff80b1d3), //#80b1d3
  //   Colors.orange[100], //Color(0xffffffb3), //#ffffb3
  //   Colors.lime[100], //Color(0xfffdb462), //#fdb462
  //   Colors.red[100], //Color(0xfffb8072), //#fb8072
  //   Colors.green[100], //Color(0xffb3de69), //#b3de69
  //   Colors.deepPurple[100], //Color(0xffbebada), //#bebada
  //   Colors.teal[100], //Color(0xff8dd3c7), //#8dd3c7
  //   Colors.purple[100], //Color(0xffbc80bd), //#bc80bd
  //   Colors.blueGrey[100], //Color(0xffd9d9d9), //#d9d9d9
  // ];

  // List<IconData> icons = [
  //   Icons.pets,
  //   Icons.accessible,
  //   Icons.school,
  //   Icons.local_restaurant,
  //   Icons.healing,
  //   Icons.home,
  //   Icons.face,
  //   Icons.explore,
  //   Icons.stars,
  //   Icons.more_horiz,
  // ];
}
