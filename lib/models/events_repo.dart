import 'package:dutchmenserve/models/events.dart';

abstract class EventRepo {
  Future<Events> fetchEvents(List events);

}

class FakeEventRepo implements EventRepo{
  List<String> entries = <String>[
    'Alpha Phi Omega',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M'
  ];
  @override
  Future<Events> fetchEvents(List events) {
   
   return Future.value(
     Events(eventTitle: entries)
   );
    // return Future(
    // Events(
    //   eventTitle: entries,);
    // ),
    }

}
