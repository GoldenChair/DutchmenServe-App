import 'package:flutter/foundation.dart';

class User {
  String firstName;
  String lastName;
  String password;
  String username;
  String emailAddress;
  List interests;
  //make into organiztiona ID
  List org; //will be org ID num
  String imagePath;
  List events;

  User({
    @required this.username,
    @required this.password,
    @required this.emailAddress,
    @required this.interests,
    @required this.org,
    @required this.events,
    this.firstName,
    this.lastName,
    this.imagePath,
  });

// user() {}
  void setUsername(String name) {
    this.username = name;
  }

  void setEmail() {
    emailAddress = username + "@lvc.edu";
  }

  void addInterests() {
    // needs.add(value);
  }
  void addOrganizzation() {
    //org.add(value);
  }
  String getUsername() {
    return username;
  }

  String getEmail() {
    return emailAddress;
  }

  List getNeeds() {
    return interests;
  }

  List getOrg() {
    return org;
  }
}
