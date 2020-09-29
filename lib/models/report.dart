import 'package:dutchmenserve/models/event.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/material.dart';

class Report {
  Event event;
  double hours;
  User user;
  List<User> additional;
  List<String> imagepaths;

  Report(Event e, double hrs, User u, List<User> add, List<String> ips) {
    this.event = e;
    this.hours = hrs;
    this.user = u;
    this.additional = add;
    this.imagepaths = ips;
  }
}
