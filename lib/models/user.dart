import 'dart:convert';

import 'package:dutchmenserve/models/event.dart';
import 'package:dutchmenserve/models/organization.dart';
import 'package:flutter/foundation.dart';

class User {
  String firstName;
  String lastName;
  String username;
  String password;
  String emailAddress;
  int id;
  List<int> interests;
  List<int> organizations;
  String imagepath;
  List<int> events;
  // no deleted

  User(String firstName, String lastName, String username, String password,
      String emailAddress,
      {int id,
      List<int> interests,
      List<int> organizations,
      String imagepath,
      List<int> events}) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.username = username;
    this.password = password;
    this.emailAddress = emailAddress;
    this.id = id;
    this.interests = interests;
    this.organizations = organizations;
    this.imagepath = imagepath;
    this.events = events;
  }

  // convert User to a json Map
  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'password': password,
        'emailAddress': emailAddress,
        'id': id, // may be null
        'interests': interests ?? [],
        'organizations': organizations,
        'imagepath': imagepath,
        'events': events ?? [],
      };

  // another constructor given a json Map
  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    username = json['username'];
    password = json['password'];
    emailAddress = json['emailAddress'];
    id = json['id'];
    interests = parseList(json['interests']);
    organizations = parseList(json['org']);
    imagepath = json['imagepath'];
    events = parseList(json['events']);
  }

  List<int> parseList(List<dynamic> json) {
    return json != null ? List<int>.from(json) : null;
  }

  // List<Event> parseList(List<Map<String, dynamic>> json) {
  //   List<Event> res = [];
  //   for (int i = 0; i < json.length; i++) {
  //     res.add(Event.fromJSON(json[i]));
  //   }
  //   return res;
  // }

  // List<Organization> parseListO(List<Map<String, dynamic>> json) {
  //   List<Organization> res = [];
  //   for (int i = 0; i < json.length; i++) {
  //     res.add(Organization.fromJSON(json[i]));
  //   }
  //   return res;
  // }

  void printUser() {
    print(lastName + ', ' + firstName);
    print(username + ' | ' + password);
    print('id: ' + id.toString());
    print(interests.toString());
    print(events.toString());
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is User &&
        o.firstName == firstName &&
        o.lastName == lastName &&
        o.username == username;
  }
}
