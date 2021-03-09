import 'package:dutchmenserve/models/interest.dart';
import 'package:flutter/material.dart';

//unused
class Constants {
  static const double padding = 10;
  static const double avatarRadius = 45;

  List<Interest> interests = [
    Interest('Animals', id: 1),
    Interest('Disabilities', id: 2),
    Interest('Education', id: 3),
    Interest('Food', id: 4),
    Interest('Health\nWellness', id: 5),
    Interest('Housing', id: 6),
    Interest('Older Adults', id: 7),
    Interest('Service Trips', id: 8),
    Interest('Veterans', id: 9),
    Interest('Other', id: 10),
  ];

  // index colors by interest id
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

  List<Color> fillColors = [
    Colors.pink[100], //Color(0xfffccde5),
    Colors.blue[100], //Color(0xff80b1d3),
    Colors.orange[100], //Color(0xffffffb3),
    Colors.lime[100], //Color(0xfffdb462),
    Colors.red[100], //Color(0xfffb8072),
    Colors.green[100], //Color(0xffb3de69),
    Colors.deepPurple[100], //Color(0xffbebada),
    Colors.teal[100], //Color(0xff8dd3c7),
    Colors.purple[100], //Color(0xffbc80bd),
    Colors.blueGrey[100], //Color(0xffd9d9d9),
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
}
