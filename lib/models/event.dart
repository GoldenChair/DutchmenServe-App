import 'dart:convert';

import 'package:dutchmenserve/models/user.dart';
import 'package:intl/intl.dart';

class Event {
  int id;
  String eventName;
  String date;
  String location;
  String description;
  String imagePath;
  bool deleted;
  List<User> registered;
  List<String> interests;

  DateTime dt;

  // constructor
  Event(String eventName, String date, String location, String description,
      List<String> interests,
      {int id, String imagePath}) {
    this.eventName = eventName;
    this.date = date;
    this.location = location;
    this.description = description;
    this.deleted = false;
    this.interests = interests;
    this.imagePath = imagePath;
    this.id = id;
    this.registered = [];
    this.dt = DateFormat('M/d/yy').add_jm().parse(date);
  }

  // another constructor given a json Map
  Event.fromJSON(Map<String, dynamic> json)
      : id = int.parse(json['id']),
        eventName = json['eventName'],
        date = json['date'],
        location = json['location'],
        description = json['description'],
        imagePath = json['imagePath'],
        deleted = json['deleted'],
        interests = json['interests'],
        registered = json['registered'];

  // convert Event to a json Map
  Map<String, dynamic> toJSON() => {
        'id': id,
        'eventName': eventName,
        'date': date,
        'location': location,
        'description': description,
        'imagePath': imagePath,
        'deleted': deleted,
        'interests': jsonEncode(interests),
        'registered': jsonEncode(registered),
      };

  void printEvent() {
    print(eventName + ": " + date + " | " + location);
  }

  void setID(int id) {
    this.id = id;
  }

  void changeDate(String newdate) {
    date = newdate;
    dt = DateFormat('M/d/yy').add_jm().parse(newdate);
  }

  void delete() {
    this.deleted = true;
  }

  @override
  bool operator == (Object o) {
    if (identical(this, o)) return true;

    return o is Event &&
        o.eventName == eventName &&
        o.date == date &&
        o.location == location &&
        o.description == description &&
        o.interests == interests;
  }

}
