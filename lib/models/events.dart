import 'dart:html';

import 'package:flutter/cupertino.dart';

enum type { Animals, Community, Seniors, Children, Other }

class Events {
 List eventTitle;
  

  Events({
    @required this.eventTitle,
  });
  // @override
  // bool operator ==(Object o) {
  //   if (identical(this, o)) return true;

  //   return 0 is Events && o.eventTitle == eventTitle && 
  // }
}
