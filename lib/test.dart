import 'package:dutchmenserve/Infrastructure/repository.dart';
import 'package:dutchmenserve/models/event.dart';

void main() async {
  FakeRepository fr = new FakeRepository();
  List<Event> test = await fr.getEvents();
  for (Event e in test) {
    e.printEvent();
  }
}