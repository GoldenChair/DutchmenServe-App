import 'dart:convert';
import 'package:intl/intl.dart';

class Event {
  String eventName;
  // String date;
  DateTime date;
  String location;
  String description;
  List<int> interests;
  int id;
  String imagepath;
  List<int> registered;
  bool deleted;

  // constructor
  Event(String eventName, DateTime date, String location, String description,
      List<int> interests,
      {int id, String imagepath}) {
    this.eventName = eventName;
    // this.date = date;
    this.date = date;
    this.location = location;
    this.description = description;
    this.interests = interests;
    this.id = id;
    this.imagepath = imagepath;
    registered = [];
    deleted = false;
    // dt = DateFormat('M/d/yy').add_jm().parse(date);
  }

  // convert Event to a json Map
  Map<String, dynamic> toJson() => {
        'eventName': eventName,
        'date': date.toIso8601String(),
        'location': location,
        'description': description,
        'interests': interests,
        'id': id, // may be null
        'imagepath': imagepath, // may be null
        'registered': registered, // may be empty
        'deleted': deleted,
      };

  // another constructor given a json Map
  Event.fromJson(Map<String, dynamic> json) {
    id = json['id']; // will be filled in by database
    eventName = json['eventName'];
    date = DateTime.parse(json['date']);
    location = json['location'];
    description = json['description'];
    imagepath = json['imagepath'];
    interests = parseList(json['interests']);
    registered = parseList(json['registered']);
    deleted = json['deleted'];
  }

  List<int> parseList(List<dynamic> json) {
    return json != null ? List<int>.from(json) : null;
  }

  void delete() {
    this.deleted = true;
  }

  void register(List<int> users) {
    registered.addAll(users);
  }

  String dateString() {
    final DateFormat formatter = DateFormat('MM/dd/yyyy H:mm');
    return formatter.format(date);
  }

  bool dateCompare(DateTime dt) {
    return date.year == dt.year && date.month == dt.month && date.day == dt.day;
  }

  void printEvent() {
    print(eventName + ': ' + date.toString() + ' | ' + location);
    print('id: ' + id.toString());
    print(registered.toString());
    print(interests.toString());
  }

  // void changeDate(String newdate) {
  //   date = newdate;
  //   dt = DateFormat('M/d/yy').add_jm().parse(newdate);
  // }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Event &&
        o.eventName == eventName &&
        o.date == date &&
        o.location == location &&
        o.description == description;
  }
}
