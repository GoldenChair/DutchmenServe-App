import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dutchmenserve/models/interest.dart';
import 'package:flutter/material.dart';

import 'organizationSelect.dart';

/*
Page to select interests by having the user
click on the interests.
 */

class SelectInterests extends StatefulWidget {
  SelectInterests({Key key}) : super(key: key);

  @override
  _SelectInterestsState createState() {
    return _SelectInterestsState();
  }
}

class _SelectInterestsState extends State<SelectInterests> {
  final List<Interest> interests = [
    Interest('Animals'),
    Interest('Disabilities'),
    Interest('Education'),
    Interest('Food'),
    Interest('Health \nWellness'),
    Interest('Housing'),
    Interest('Older Adults'),
    Interest('Service Trips'),
    Interest('Veterans'),
    Interest('Other'),
  ];
  final List<Icon> icons = [
    Icon(Icons.pets, semanticLabel: 'Animals'),
    Icon(Icons.accessible, semanticLabel: 'Disabilities'),
    Icon(Icons.school, semanticLabel: 'Education'),
    Icon(Icons.local_restaurant, semanticLabel: 'Food'),
    Icon(Icons.healing, semanticLabel: 'Health and Wellness'),
    Icon(Icons.home, semanticLabel: 'Housing'),
    Icon(Icons.face, semanticLabel: 'Older Adults'),
    Icon(Icons.explore, semanticLabel: 'Service Trips'),
    Icon(Icons.stars, semanticLabel: 'Veterans'),
    Icon(Icons.more_horiz, semanticLabel: 'Other'),
  ];
  // final List<Icon> icons = [
  //   Icon(Icons.pets,
  //       semanticLabel: 'Animals', size: 60, color: Colors.blueGrey[800]),
  //   Icon(Icons.accessible,
  //       semanticLabel: 'Disabilities', size: 60, color: Colors.blueGrey[800]),
  //   Icon(Icons.school,
  //       semanticLabel: 'Education', size: 60, color: Colors.blueGrey[800]),
  //   Icon(Icons.local_restaurant,
  //       semanticLabel: 'Food', size: 60, color: Colors.blueGrey[800]),
  //   Icon(Icons.healing,
  //       semanticLabel: 'Health and Wellness',
  //       size: 60,
  //       color: Colors.blueGrey[800]),
  //   Icon(Icons.home,
  //       semanticLabel: 'Housing', size: 60, color: Colors.blueGrey[800]),
  //   Icon(Icons.face,
  //       semanticLabel: 'Older Adults', size: 60, color: Colors.blueGrey[800]),
  //   Icon(Icons.explore,
  //       semanticLabel: 'Service Trips', size: 60, color: Colors.blueGrey[800]),
  //   Icon(Icons.stars,
  //       semanticLabel: 'Veterans', size: 60, color: Colors.blueGrey[800]),
  //   Icon(Icons.more_horiz,
  //       semanticLabel: 'Other', size: 60, color: Colors.blueGrey[800]),
  // ];

  List<bool> _s = List.generate(12, (index) => false);

  @override
  Widget build(BuildContext context) {
    List<Column> widgets = List.generate(
      10,
      (index) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: icons[index],
            flex: 4,
          ),
          // icons[index],
          Flexible(
            child: Text(
              interests[index].interest,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Select your interests')),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: Row(
                children: [
                  Flexible(child: Container(color: Colors.blueGrey[50])),
                  Flexible(
                    flex: 8,
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          child: GridView.count(
                              crossAxisCount: 2,
                              children: widgets.asMap().entries.map(
                                (widget) {
                                  return Container(
                                    child: LayoutBuilder(
                                      builder: (context, constraints) {
                                        return ToggleButtons(
                                          constraints: BoxConstraints.expand(
                                            width: constraints.maxWidth - 2,
                                          ),
                                          isSelected: [_s[widget.key]],
                                          onPressed: (int key) {
                                            // note: key stays 0 and never changes, don't use; use widget.key
                                            setState(() {
                                              _s[widget.key] = !_s[widget.key];
                                            });
                                          },
                                          children: [widget.value],
                                        );
                                      },
                                    ),
                                  );
                                },
                              ).toList()),
                        ),
                      ],
                    ),
                  ),
                  Flexible(child: Container(color: Colors.blueGrey[50])),
                ],
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => setUpOrgPage()));
              },
              child: Text('Next '),
            ),
          ],
        ),
      ),
    );
  }
}

// List<bool> _selections = List.generate(2, (index) => false);
// List<bool> s2 = List.generate(2, (index) => false);
// List<bool> s3 = List.generate(2, (index) => false);
// List<bool> s4 = List.generate(2, (index) => false);
// List<bool> s5 = List.generate(2, (index) => false);
// List<bool> s6 = List.generate(2, (index) => false);

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     ToggleButtons(
//       isSelected: _selections,
//       children: [
//         Container(
//           // height: 175,
//           width: 150,
//           margin: EdgeInsets.only(left: 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Spacer(),
//               Icon(
//                 Icons.gavel,
//                 size: 100,
//                 color: _selections[0]
//                     ? Colors.blue[800]
//                     : Colors.black,
//               ),
//               Flexible(
//                 child: Text('Advocacy & Human Rights'),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.only(right: 30),
//           // height: 175,
//           width: 150,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Spacer(),
//               Icon(Icons.pets,
//                   size: 100,
//                   color: _selections[1]
//                       ? Colors.blue[800]
//                       : Colors.black),
//               Text('Animals'),
//             ],
//           ),
//         ),
//       ],
//       onPressed: (int index) {
//         setState(() {
//           _selections[index] = !_selections[index];
//         });
//       },
//     ),
//   ],
// ),
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     ToggleButtons(
//         isSelected: s2,
//         children: [
//           Container(
//             margin: EdgeInsets.only(left: 30, top: 30),
//             // height: 175,
//             width: 150,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Spacer(),
//                 Icon(Icons.color_lens,
//                     size: 100,
//                     color: s2[0] ? Colors.blue[800] : Colors.black),
//                 Text('Arts & Culture'),
//               ],
//             ),
//           ),
//           Container(
//             //height: 175,
//             margin: EdgeInsets.only(right: 30),
//             width: 150,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Spacer(),
//                 Icon(Icons.child_care,
//                     size: 100,
//                     color: s2[1] ? Colors.blue[800] : Colors.black),
//                 Text('Children & Youth'),
//               ],
//             ),
//           ),
//         ],
//         onPressed: (int index) {
//           setState(() {
//             s2[index] = !s2[index];
//           });
//         }),
//   ],
// ),
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     ToggleButtons(
//       isSelected: s3,
//       children: [
//         Container(
//           // height: 175,
//           width: 150,
//           margin: EdgeInsets.only(left: 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Spacer(
//                 flex: 1,
//               ),
//               Icon(Icons.group,
//                   size: 100,
//                   color: s3[0] ? Colors.blue[800] : Colors.black),
//               Text('Community'),
//             ],
//           ),
//         ),
//         Container(
//           // height: 175,
//           width: 150,
//           margin: EdgeInsets.only(right: 30),
//           child: Center(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Spacer(),
//                 Icon(Icons.computer,
//                     size: 100,
//                     color: s3[1] ? Colors.blue[800] : Colors.black),
//                 Text('Technology'),
//               ],
//             ),
//           ),
//         ),
//       ],
//       onPressed: (int index) {
//         setState(() {
//           s3[index] = !s3[index];
//         });
//       },
//     ),
//   ],
// ),
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     ToggleButtons(
//       isSelected: s4,
//       children: [
//         Center(
//           child: Container(
//             // height: 175,
//             width: 150,
//             margin: EdgeInsets.only(left: 30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Spacer(),
//                 Icon(Icons.school,
//                     size: 100,
//                     color: s4[0] ? Colors.blue[800] : Colors.black),
//                 Text('Education & Literacy'),
//               ],
//             ),
//           ),
//         ),
//         Center(
//           child: Container(
//             // height: 175,
//             width: 150,
//             margin: EdgeInsets.only(right: 30),
//             child: Center(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Spacer(
//                     flex: 5,
//                   ),
//                   Icon(Icons.face,
//                       size: 100,
//                       color:
//                           s4[1] ? Colors.blue[800] : Colors.black),
//                   Text('Seniors'),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//       onPressed: (int index) {
//         setState(() {
//           s4[index] = !s4[index];
//         });
//       },
//     ),
//   ],
// ),
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     ToggleButtons(
//       isSelected: s5,
//       children: [
//         Container(
//           // height: 175,
//           width: 150,
//           margin: EdgeInsets.only(left: 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Spacer(),
//               Icon(
//                 Icons.more_horiz,
//                 size: 100,
//                 color: s5[0] ? Colors.blue[800] : Colors.black,
//               ),
//               Text('Other'),
//             ],
//           ),
//         ),
//         Container(
//           // height: 175,
//           width: 150,
//           margin: EdgeInsets.only(right: 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Spacer(),
//               Icon(
//                 Icons.all_inclusive,
//                 size: 100,
//                 color: s5[1] ? Colors.blue[800] : Colors.black,
//               ),
//               Text('All'),
//             ],
//           ),
//         )
//       ],
//       onPressed: (int index) {
//         setState(() {
//           s5[index] = !s5[index];
//         });
//       },
//     ),
//   ],
// ),
