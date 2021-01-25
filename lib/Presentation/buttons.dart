import 'package:flutter/material.dart';

// normal button
class NormalButton extends StatelessWidget {
  final String s;
  final Function press;
  final EdgeInsets padding;
  final Color color;
  final Color textColor;

  NormalButton(this.s, this.press, {this.padding, this.color, this.textColor});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: press,
      padding: padding ?? EdgeInsets.all(0.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(90)),
          color: color ?? null,
        ),
        padding: EdgeInsets.symmetric(horizontal: 90, vertical: 12),
        child: Text(s,
            style: TextStyle(
              fontSize: 21,
              color: textColor ?? Color(0xffaacde3), 
              fontWeight: FontWeight.w900,
            )),
      ),
    );
  }
}

// // function to create gradient filled button
// RaisedButton createGradient(String s, Gradient grad, Function press) {
//   return RaisedButton(
//     onPressed: press,
//     padding: EdgeInsets.all(0.0),
//     child: Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(90)),
//         gradient: grad,
//       ),
//       padding: EdgeInsets.symmetric(horizontal: 90, vertical: 12),
//       child: Text(s, style: TextStyle(fontSize: 21)),
//     ),
//   );
// }

// // function to create gradient outline button
// RaisedButton createGradButton(String s, LinearGradient lg, Function press) {
//   return RaisedButton(
//     onPressed: press,
//     padding: EdgeInsets.all(0.0),
//     textColor: Colors.white,
//     child: Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(90)),
//         gradient: lg,
//       ),
//       padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
//       child: Container(
//           decoration: BoxDecoration(
//               border: null,
//               borderRadius: BorderRadius.all(Radius.circular(90)),
//               boxShadow: null,
//               color: Color(0xfff9f9f9)),
//           padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 11),
//           child: Text(s, style: TextStyle(color: Colors.black))),
//     ),
//   );
// }

// gradient appbar
//   flexibleSpace: Container(
//     decoration: BoxDecoration(
//       gradient: LinearGradient(
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//         colors: <Color>[
//           Color(0xff080644),
//           Color(0xff080644),
//           Colors.indigo[900],
//           Colors.deepPurple[900],
//           Colors.indigo[900],
//         ],
//       ),
//     ),
//   ),
