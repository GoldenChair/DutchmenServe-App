import 'package:flutter/material.dart';

class Event {
  String eventName;
  var date; // DateTime object
  String location;
  String description;
  String imagePath;
  List<String> interests;

  // constructor
  Event({
    @required this.eventName,
    @required this.date,
    @required this.location,
    @required this.description,
    @required this.interests,
    this.imagePath,
  });
}
