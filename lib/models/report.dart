import 'dart:convert';

import 'package:dutchmenserve/models/event.dart';
import 'package:dutchmenserve/models/user.dart';

class Report {
  Event event;
  double hours;
  User user;
  List<User> additional;
  List<String> imagepaths;
  int id;
  bool deleted;

  Report(Event e, double hrs, User u, [List<User> add, List<String> ips]) {
    this.event = e;
    this.hours = hrs;
    this.user = u;
    this.additional = add;
    this.imagepaths = ips;
    this.deleted = false;
  }

  // another constructor given a json Map
  Report.fromJSON(Map<String, dynamic> json) {
    this.event = Event.fromJSON(json['event']);
    this.hours = double.parse(json['hours']);
    this.user = User.fromJSON(json['user']);
    this.additional =
        parseList(List<Map<String, dynamic>>.from(json['additional']));
    this.imagepaths = List.from(json['imagepaths']);
    this.deleted = json['deleted'];
  }

  List<User> parseList(List<Map<String, dynamic>> json) {
    List<User> res = [];
    for (int i = 0; i < json.length; i++) {
      res.add(User.fromJSON(json[i]));
    }
    return res;
  }

  // convert Report to a json Map
  Map<String, dynamic> toJSON() => {
        'event': event.toJSON(),
        'hours': hours,
        'user': user.toJSON(),
        'additional': jsonEncode(additional),
        'imagePath': jsonEncode(imagepaths),
        'deleted': deleted,
      };

  void setID(int id) {
    this.id = id;
  }

  void delete() {
    deleted = true;
  }

  void printReport() {
    print(User(
                emailAddress: 'ajl008@lvc.edu',
                events: [],
                interests: [],
                organizations: [],
                password: null,
                username: 'ajl008')
            .getUsername() +
        ": " +
        event.date +
        ", " +
        event.eventName +
        ", " +
        hours.toString());
  }
}
