import 'dart:convert';

import 'package:dutchmenserve/models/event.dart';
import 'package:dutchmenserve/models/user.dart';

class Report {
  // Event event;
  int eid;
  double hours;
  // User user;
  int uid;
  int id;
  List<String> imagepaths;
  List<int> additional;
  bool deleted;

  // additional cannot be null
  Report(Event e, double hrs, User u,
      {int id, List<int> add, List<String> ips}) {
    eid = e.id;
    hours = hrs;
    uid = u.id;
    this.id = id;
    additional = add ?? <int>[];
    imagepaths = ips;
    deleted = false;
  }
  Report.fromID(int eid, double hrs, int uid,
      {int id, List<int> add, List<String> ips}) {
    this.eid = eid;
    hours = hrs;
    this.uid = uid;
    this.id = id;
    additional = add ?? <int>[];
    imagepaths = ips;
    deleted = false;
  }

  // convert Report to a json Map
  Map<String, dynamic> toJson() => {
        'event': eid,
        'hours': hours,
        'user': uid,
        'id': id, // may be null
        'imagepath': imagepaths,
        'additional': additional,
        'deleted': deleted,
      };

  // another constructor given a json Map
  Report.fromJson(Map<String, dynamic> json) {
    var eid = json['event'];
    // event = Event.lookup(eid);
    this.eid = eid;
    hours = double.parse(json['hours']);
    var uid = json['user'];
    // user = User.lookup(uid);
    this.uid = uid;
    id = json['id'];
    additional = List<int>.from(json['additional']);
    imagepaths = parseList(json['imagepaths']);
    deleted = json['deleted'];
  }

  List<String> parseList(List<dynamic> json) {
    return json != null ? List<String>.from(json) : null;
  }

  // List<User> parseList(List<Map<String, dynamic>> json) {
  //   List<User> res = [];
  //   for (int i = 0; i < json.length; i++) {
  //     res.add(User.fromJSON(json[i]));
  //   }
  //   return res;
  // }

  void printReport() {
    // event.printEvent();
    print('Event: ' + eid.toString());
    print('id: ' + id.toString());
    // user.printUser();
    print('User: ' + uid.toString());
    print(hours.toString());
    print(additional.toString());
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Report &&
        // o.event == event &&
        o.eid == eid &&
        // o.user == user &&
        o.uid == uid &&
        o.hours == hours;
  }
}
