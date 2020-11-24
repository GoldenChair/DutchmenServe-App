import 'dart:convert';

import 'package:dutchmenserve/models/user.dart';
import 'package:intl/intl.dart';

class Event {
  int id;
  String eventName;
  String date;
  String location;
  String description;
  List<String> interests;
  bool deleted;

  List<User> registered;

  DateTime dt;
  String imagePath;

  // constructor
  Event(String eventName, String date, String location, String description,
      List<String> interests,
      {String imagePath}) {
    this.eventName = eventName;
    this.date = date;
    this.dt = DateFormat('M/d/yy').add_jm().parse(date);
    this.location = location;
    this.description = description;
    this.interests = interests;
    this.registered = [];
    this.deleted = false;
    if (imagePath != null) this.imagePath = imagePath;
  }

  // another constructor given a json Map
  Event.fromJSON(Map<String, dynamic> json)
      : eventName = json['eventName'],
        date = json['date'],
        location = json['location'],
        description = json['description'],
        interests = List.from(json['interests']),
        imagePath = json['imagePath'],
        id = int.parse(json['id']),
        deleted = json['deleted'];

  // convert Event to a json Map
  Map<String, dynamic> toJSON() => {
        'eventName': eventName,
        'date': date,
        'location': location,
        'description': description,
        'interests': jsonEncode(interests),
        'imagePath': imagePath,
        'deleted': deleted,
      };

  void printEvent() {
    print(eventName + ": " + date + " | " + location);
  }

  void setID(int id) {
    this.id = id;
  }

  void delete() {
    this.deleted = true;
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Event &&
        o.eventName == eventName &&
        o.date == date &&
        o.location == location &&
        o.description == description &&
        o.interests == interests;
  }

  int get hashCode => super.hashCode;
}
