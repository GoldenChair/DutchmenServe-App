import 'package:intl/intl.dart';

class Event {
  String eventName;
  String date;
  DateTime dt;
  String location;
  String description;
  List<String> interests;
  String imagePath;
  bool imageboo;

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
    if (imagePath != null) {
      this.imagePath = imagePath;
      this.imageboo = true;
    } else
      this.imageboo = false;
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
}
