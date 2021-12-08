import 'dart:ui';

import 'package:flutter/material.dart';

class Interest {
  int id;
  String interest;
  IconData icon;
  Color color;
  Color fillColor;

  Interest(String interest, IconData icon, Color color, Color fillColor,
      {int id}) {
    this.interest = interest;
    this.id = id;
    this.icon = icon;
    this.color = color;
    this.fillColor = fillColor;
  }

  Map<String, dynamic> toJson() => {
        'interest': interest,
        'id': id,
        'icon': icon,
        'color': color,
        'fillColor': fillColor,
      };

  Interest.fromJson(Map<String, dynamic> json) {
    id = json['id']; // will be filled in by database
    interest = json['interest'];
    icon = json['icon'];
    color = json['color'];
    fillColor = json['fillColor'];
  }

  void printInterest() {
    print(id.toString() + ': ' + interest + ', ' + icon.toString());
  }

  Color getColor() {
    return color;
  }

  Color getFillColor() {
    return fillColor;
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
} // '#f9f9f9'.toColor(), //f9f9f9 //55B9F4
