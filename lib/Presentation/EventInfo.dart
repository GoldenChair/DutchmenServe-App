import 'package:dutchmenserve/models/event.dart';
import 'package:flutter/material.dart';

class EventInfo extends StatelessWidget {
  final Event e;
  const EventInfo(this.e);
  
  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text(e.eventName),
      ),
      body: Text(e.description),
    );
  }
}
