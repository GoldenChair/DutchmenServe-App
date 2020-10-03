import 'package:dutchmenserve/models/user.dart';
import 'package:intl/intl.dart';

class Event {
  String eventName;
  String date;
  String location;
  String description;
  List<String> interests;

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
    this.registered = new List<User>();
    if (imagePath != null) this.imagePath = imagePath;
  }

  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Event &&
        o.eventName == eventName &&
        o.date == date &&
        o.location == location &&
        o.description == description &&
        o.interests == interests;
  }

  void printEvent() {
    print(eventName + ": " + date + " | " + location);
  }
}
