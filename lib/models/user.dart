import 'dart:convert';

import 'package:dutchmenserve/models/event.dart';
import 'package:dutchmenserve/models/organization.dart';
import 'package:flutter/foundation.dart';

class User {
  String firstName;
  String lastName;
  String password;
  String username;
  String emailAddress;
  List<String> interests;
  List<Organization> organizations;
  String imagePath;
  List<Event> events;
  int id;

  User({
    @required this.username,
    @required this.password,
    @required this.emailAddress,
    @required this.interests,
    @required this.organizations,
    @required this.events,
    @required this.firstName,
    @required this.lastName,
    this.id,
    this.imagePath,
  });

  // another constructor given a json Map
  User.fromJSON(Map<String, dynamic> json) {
    this.username = json['username'];
    this.password = json['password'];
    this.emailAddress = json['emailAddress'];
    this.interests = List<String>.from(json['interests']);
    this.organizations =
        parseListO(List<Map<String, dynamic>>.from(json['org']));
    this.events = parseList(List<Map<String, dynamic>>.from(json['events']));
    this.id = int.parse(json['id']);
    this.firstName = json['firstName'];
    this.lastName = json['lastName'];
  }

  List<Event> parseList(List<Map<String, dynamic>> json) {
    List<Event> res = [];
    for (int i = 0; i < json.length; i++) {
      res.add(Event.fromJSON(json[i]));
    }
    return res;
  }

  List<Organization> parseListO(List<Map<String, dynamic>> json) {
    List<Organization> res = [];
    for (int i = 0; i < json.length; i++) {
      res.add(Organization.fromJSON(json[i]));
    }
    return res;
  }

  // convert User to a json Map
  Map<String, dynamic> toJSON() => {
        'username': username,
        'password': password,
        'emailAddress': emailAddress,
        'interests': jsonEncode(interests),
        'organizations': jsonEncode(organizations),
        'imagePath': imagePath,
        'events': jsonEncode(events),
        'firstName': jsonEncode(firstName),
        'lastName': jsonEncode(lastName),
        'id': jsonEncode(id),
      };

// user() {}
  void setUsername(String name) {
    this.username = name;
  }

  void setID(int id) {
    this.id = id;
  }

  void setEmail() {
    emailAddress = username + "@lvc.edu";
  }

  void addInterests() {
    // needs.add(value);
  }
  void addOrganization() {
    //org.add(value);
  }
  String getUsername() {
    return username;
  }

  String getEmail() {
    return emailAddress;
  }

  List getInterests() {
    return interests;
  }

  List getOrganizations() {
    return organizations;
  }
}
