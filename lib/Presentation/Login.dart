import 'dart:ui';

import 'package:dutchmenserve/Presentation/buttons.dart';
import 'package:dutchmenserve/Presentation/homePage.dart';
import 'package:dutchmenserve/Presentation/initialHomePage.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        brightness: Brightness.dark,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
              statusBarColor: Color(0xff001d35),
              systemNavigationBarColor: Color(0xff002A4E),
              systemNavigationBarIconBrightness: Brightness.dark,
            ));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InitialLoginHome()),
            );
          },
        ),
      ),
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _loginFormKey = GlobalKey<FormState>();

  final unController = TextEditingController();
  final pwController = TextEditingController();

  @override
  void dispose() {
    unController.dispose();
    pwController.dispose();

    super.dispose();
  }

  bool _obscurePW = true;

  // Textfield decoration
  InputDecoration decor(String labelText, FocusScopeNode focusNode, bool pw) {
    return InputDecoration(
      isDense: true,
      filled: true,
      fillColor: Color(0xfff9f9f9),
      labelText: labelText,
      labelStyle: TextStyle(fontSize: 16, color: Colors.grey[700]),
      errorStyle:
          focusNode.hasFocus ? TextStyle(fontSize: 0, height: 0) : TextStyle(),
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      suffixIcon: pw
          ? IconButton(
              onPressed: () {
                setState(() {
                  _obscurePW = !_obscurePW;
                });
              },
              icon: Icon(Icons.remove_red_eye),
              color: _obscurePW ? Colors.blueGrey : Colors.grey[300],
              splashRadius: .01,
            )
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Form(
        key: _loginFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: <Widget>[
                    Spacer(flex: 3),
                    TextFormField(
                      controller: unController,
                      decoration:
                          decor('LVC Username', FocusScope.of(context), false),
                      validator: (value) {
                        if (value.isEmpty) {
                          return '*required';
                        }
                        return value.contains('@')
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                    Spacer(),
                    TextFormField(
                      controller: pwController,
                      obscureText: _obscurePW,
                      decoration:
                          decor('LVC Password', FocusScope.of(context), true),
                      validator: (value) {
                        if (value.isEmpty) {
                          return '*required';
                        }
                        return null;
                      },
                    ),
                    Spacer(flex: 4),
                    NormalButton(
                      'Next',
                      () {
                        if (_loginFormKey.currentState.validate()) {
                          // TODO: and database verifies User

                          SystemChrome.setSystemUIOverlayStyle(
                              SystemUiOverlayStyle(
                            statusBarColor: Color(0xff002A4E),
                            systemNavigationBarColor: Color(0xfff9f9f9),
                            systemNavigationBarIconBrightness: Brightness.dark,
                          ));
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                        }
                      },
                    ),
                    Spacer(flex: 9),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//   SingleChildScrollView(
//           child: Container(
//             color: Colors.white,
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 70,
//                 ),
//                 Center(
//                   child: Container(
//                     alignment: Alignment.center,
//                     height: 100,
//                     width: 100,
//                     child: Icon(
//                       Icons.account_circle,
//                       size: 120,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 70,
//                 ),
//                 TextField(
//                     //controller: myController1,
//                     decoration: new InputDecoration(
//                   border: new OutlineInputBorder(
//                       borderSide: new BorderSide(color: Colors.black)),
//                   hintText: 'U S E R N A M E',
//                 )),
//                 SizedBox(height: 30),
//                 TextField(
//                     decoration: new InputDecoration(
//                   border: new OutlineInputBorder(
//                       borderSide: new BorderSide(color: Colors.black)),
//                   hintText: 'P A S S W O R D',
//                 )),
//                 SizedBox(height: 30),
//                 Container(
//                   child: Align(
//                     alignment: Alignment.bottomCenter,
//                     child: RaisedButton(
//                       color: Colors.blue[800],
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             new MaterialPageRoute(
//                                 builder: (context) => HomePage()));
//                       },
//                       child: Text('Next ',
//                           style: TextStyle(
//                             fontSize: 20,
//                           )),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
