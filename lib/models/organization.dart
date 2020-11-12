import 'dart:convert';

import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/cupertino.dart';

class Organization {
  String orgName;
  List users;
  int orgID;
  List officers;
  String description;
  String email;
  String imagepath;
  bool deleted;

  Organization({
    @required this.orgName,
    @required this.description,
    @required this.email,
    @required this.officers,
    this.users,
    this.orgID,
    this.deleted = false,
    //     @required this.orgName,
    // @required this.orgID,
    // @required this.usersIDs,
    // @required this.officers,
  });

  // another constructor given a json Map
  Organization.fromJSON(Map<String, dynamic> json) {
    this.orgName = json['orgName'];
    this.description = json['description'];
    this.email = json['email'];
    this.orgID = int.parse(json['orgID']);
    this.users = parseList(List<Map<String, dynamic>>.from(json['users']));
    this.officers =
        parseList(List<Map<String, dynamic>>.from(json['officers']));
    this.imagepath = json['imagepath'];
    this.deleted = deleted;
  }

  List<User> parseList(List<Map<String, dynamic>> json) {
    List<User> res = [];
    for (int i = 0; i < json.length; i++) {
      res.add(User.fromJSON(json[i]));
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

  // convert Organization to a json Map
  Map<String, dynamic> toJSON() => {
        'orgName': orgName,
        'description': description,
        'email': email,
        'users': jsonEncode(users),
        'officers': jsonEncode(officers),
        'imagePath': imagepath,
        'deleted': deleted,
      };

  void setOrgName(String s) {
    this.orgName = s;
  }

  void printOrgName() {
    print(this.orgName);
  }

  void addMembers(User u) {
    users.add(u);
  }
}
