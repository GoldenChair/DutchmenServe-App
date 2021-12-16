import 'package:dutchmenserve/models/event.dart';

class User {
  String firstName;
  String lastName;
  String username;
  String token;
  String emailAddress;
  int id;
  List<String> interests;
  List<int> organizations;
  List<int> officer;
  String imagepath;
  List<int> events;

  User(String firstName, String lastName, String username, String token,
      {String emailAddress,
      int id,
      List<String> interests,
      List<int> organizations,
      List<int> officer,
      String imagepath,
      List<int> events,
      List<int> favorites}) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.username = username;
    this.token = token;
    this.emailAddress = emailAddress ?? (username + '@lvc.edu');
    this.id = id;
    this.interests = interests ?? [];
    this.organizations = organizations ?? [];
    this.officer = officer ?? [];
    this.imagepath = imagepath;
    this.events = events ?? [];
  }

// // Empty user which represents an unauthenticated user.
//   static const empty = User(emailAddress: '', id: '', name: null, imagepath: null);

  // convert User to a json Map
  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'token': token,
        'emailAddress': emailAddress,
        'id': id, // may be null
        'interests': interests ?? [],
        'organizations': organizations,
        'officer': officer,
        'imagepath': imagepath,
        'events': events ?? [],
      };

  // another constructor given a json Map
  // temp fix for db user as lvc server currently does not store first/lastname and email in User object
  // TODO possibly add relation from lvc student to lvc user for those fields
  User.fromJson(Map<String, dynamic> json) {
    // firstName = json['firstName'];
    // lastName = json['lastName'];
    firstName = "John"; // Hardcoded, needs to get data from server
    lastName = "Doe"; // Hardcoded, needs to get data from server
    username = json['username'];
    token = json['token'];
    emailAddress = json['username'] + "@lvc.edu"; // Hardcoded, Maybe its fine? Need to look into if username will ever be different from email
    id = json['id'];
    interests = parseListString(json['interests']);
    organizations = parseList(json['org']);
    officer = parseList(json['officer']);
    imagepath = json['imagepath'];
    events = parseList(json['events']);
  }

  List<int> parseList(List<dynamic> json) {
    return json != null ? List<int>.from(json) : null;
  }
  List<String> parseListString(List<dynamic> json) {
    return json != null ? List<String>.from(json) : null;
  }

  bool isRegistered(Event e) {
    return events.contains(e.id);
  }

  void unregister(Event e) {
    events.remove(e.id);
    e.registered.remove(id);
  }

  void register(Event e) {
    events.add(e.id);
    e.registered.add(id);
  }

  void registerAll(List<Event> ev) {
    for (var e in ev) {
      register(e);
    }
  }

  void printUser() {
    print(lastName + ', ' + firstName);
    print(username + ' | ' + token);
    print('id: ' + id.toString());
    print(interests.toString());
    print(events.toString());
  }
}
