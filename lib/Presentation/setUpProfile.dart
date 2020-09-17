import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';
import 'profilePage.dart';

// class LoginHome extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         ColorFiltered(
//           colorFilter: ColorFilter.mode(
//             Colors.grey,
//             BlendMode.saturation,
//           ),
//           child: HomePage(),
//         ),
//         Container(
//           child: Column(
//             children: [
//               // SizedBox(
//               //   height: 600,
//               // ),
//               Container(
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: RaisedButton(
//                     color: Colors.blue[800],
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           new MaterialPageRoute(
//                               builder: (context) => SetUpPg1()));
//                     },
//                     child: Text('Log In ',
//                         style: TextStyle(
//                           fontSize: 20,
//                         )),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }

//   // function to create rounded text expandable
//   Expanded createExpanded(String s, IconData iconData, double margin) {
//     return Expanded(
//       flex: 3,
//       child: Container(
//         margin: EdgeInsets.only(right: margin),
//         decoration: BoxDecoration(
//           border: Border.all(),
//           borderRadius: BorderRadius.only(
//             topRight: Radius.circular(70.0),
//             bottomRight: Radius.circular(70.0),
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Spacer(),
//             Flexible(
//               flex: 8,
//               child: Icon(
//                 iconData,
//                 size: 50,
//                 color: Colors.black,
//               ),
//             ),
//             Spacer(),
//             Flexible(
//               flex: 25,
//               // child: Padding(
//               //   padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
//               //   child: Text(
//               //     s,
//               //     style: TextStyle(fontFamily: 'KiteOne', fontSize: 14),
//               //   ),
//               // ),
//               child: AutoSizeText(
//                 s,
//                 style: TextStyle(fontFamily: 'KiteOne'),
//                 maxLines: 4,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class LoginIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Log Into Your Account'),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 100,
                    child: Icon(
                      Icons.account_circle,
                      size: 120,
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                TextField(
                    //controller: myController1,
                    decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.black)),
                  hintText: 'U S E R N A M E',
                )),
                SizedBox(height: 30),
                TextField(
                    decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.black)),
                  hintText: 'P A S S W O R D',
                )),
                SizedBox(height: 30),
                Container(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RaisedButton(
                      color: Colors.blue[800],
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Text('Next ',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

//       body: Column(
//         //have row and then put in the column
//         //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,

//         children: [
//           Spacer(),
//           Expanded(
//             flex: 2,
//             child: Container(
//               margin: const EdgeInsets.only(right: 10),
//               decoration: BoxDecoration(
//                   border: Border.all(),
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(70.0),
//                       bottomRight: Radius.circular(70.0))),

//               // height: 130,

//               // width: 400,

//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Icon(
//                     Icons.public,
//                     size: 50,
//                     color: Colors.black,
//                   ),
//                   //SizedBox(width: 20),
//                   Flexible(
//                     child: Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Text(
//                         'We empower students for a life of citizenship both in our community and around the globe',
//                         style: TextStyle(fontFamily: 'KiteOne', fontSize: 14),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Spacer(),
//           Expanded(
//             flex: 2,
//             child: Container(
//                 margin: const EdgeInsets.only(right: 40),
//                 decoration: BoxDecoration(
//                     border: Border.all(),
//                     borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(70),
//                         bottomRight: Radius.circular(70))),
//                 // height: 130,
//                 // width: 350,
//                 //color: Colors.teal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Icon(
//                       Icons.people,
//                       size: 50,
//                       color: Colors.black,
//                     ),
//                     SizedBox(width: 20),
//                     Flexible(
//                         child: Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Text(
//                         'Students may enhance their self-knowledge as they examine their own identity and purpose in the context of a diverse world in which a variety of needs and injustices exist',
//                         style: TextStyle(fontFamily: 'KiteOne', fontSize: 14),
//                       ),
//                     ))
//                   ],
//                 )),
//           ),
//           Spacer(),
//           Expanded(
//             flex: 2,
//             child: Container(
//                 margin: EdgeInsets.only(right: 60),
//                 decoration: BoxDecoration(
//                     border: Border.all(),
//                     borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(70.0),
//                         bottomRight: Radius.circular(70.0))),
//                 // height: 130,
//                 // width: 300,
//                 //color: Colors.teal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Icon(
//                       Icons.gavel,
//                       size: 45,
//                       color: Colors.black,
//                     ),
//                     SizedBox(width: 20),
//                     Flexible(
//                         child: Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Text(
//                         'Students may grow their awareness and knowledge regarding needs and justice issues in a variety of areas',
//                         style: TextStyle(fontFamily: 'KiteOne', fontSize: 14),
//                       ),
//                     ))
//                   ],
//                 )),
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.only(right: 20),
//               child: Container(
//                 child: Align(
//                   alignment: Alignment.bottomRight,
//                   child: RaisedButton(
//                     color: Colors.blue[800],
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           new MaterialPageRoute(
//                               builder: (context) => SetUpPg1()));
//                     },
//                     child: Text('Log In ',
//                         style: TextStyle(
//                           fontSize: 20,
//                         )),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Spacer(),
//         ],
//       ),
//     );
//   }
// }
