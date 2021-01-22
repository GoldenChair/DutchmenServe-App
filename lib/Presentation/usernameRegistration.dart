import 'package:dutchmenserve/Presentation/interestSelection.dart';
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

/*
This class will prompt for a username and password and for password 
confirmation for registration purposes
*/

class UserNameReg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register New Account',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.indigo[900],
                Colors.deepPurple[800],
                Colors.indigo[400],
              ],
            ),
          ),
        ),
      ),
      body: RegisterForm(),
    );

    // username = myController1.text;
    // password = myController2.text;
    // confirm = myController3.text;
    // //profile.setUsername(username);
    // print(username);
  }
}

class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

// This class holds data related to the form.
class RegisterFormState extends State<RegisterForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return SingleChildScrollView(
      child: Form(
        key: _registerFormKey,
        child: Column(
          children: <Widget>[
            // Add TextFormFields and ElevatedButton here.
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  // hintText: 'LVC Username',
                  labelText: 'LVC Username',
                  labelStyle: TextStyle(fontSize: 16),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return value.contains('@') ? 'Do not use the @ char.' : null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: PasswordField(
                hasFloatingPlaceholder: true,
                floatingText: 'LVC Password',
                // pattern: r'.*[@$#.*].*',
                // errorMessage:
                //     'must contain special character either . * @ # \$',
              ),
            ),
            ElevatedButton(
              child: Text('Next '),
              onPressed: () {
                if (_registerFormKey.currentState.validate()) {
                  // and database verifies LVC user login

                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  // Scaffold.of(context).showSnackBar(
                  //     SnackBar(content: Text('Account verified')));

                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => SelectInterests()));
                }
              },
              // style: ElevatedButton.styleFrom(
              //   primary: Colors.indigo[900],
              //   onPrimary: Colors.white,
              //   onSurface: Colors.grey,
              //   shadowColor: Colors.grey[900],
              //   elevation: 5,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}

// Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextFormField(
//                 decoration: InputDecoration(hintText: 'First Name'),
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter some text';
//                   }
//                   return null;
//                 },
//               ),
//             ),

// final User profile = new User('Fname', 'Lname', 'uname', 'pw', 'email');
// final myController1 = TextEditingController();
// final myController2 = TextEditingController();
// final myController3 = TextEditingController();

// var username;
// var password;
// var confirm;

// @override
// void dispose() {
//   myController1.dispose();
//   myController2.dispose();
//   myController3.dispose();
// }

// SingleChildScrollView(
//           child: Container(
//             color: Colors.white,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 TextField(
//                     controller: myController1,
//                     decoration: new InputDecoration(
//                       border: new OutlineInputBorder(
//                           borderSide: new BorderSide(color: Colors.black)),
//                       hintText: 'U S E R N A M E',
//                     )),
//                 SizedBox(height: 30),
//                 TextField(
//                     decoration: new InputDecoration(
//                   border: new OutlineInputBorder(
//                       borderSide: new BorderSide(color: Colors.black)),
//                   hintText: 'P A S S W O R D',
//                 )),
//                 SizedBox(height: 30),
//                 TextField(
//                     decoration: new InputDecoration(
//                   border: new OutlineInputBorder(
//                       borderSide: new BorderSide(color: Colors.black)),
//                   hintText: 'C O N F I R M   P A S S W O R D',
//                 )),
//                 SizedBox(
//                   height: 25,
//                 ),
//                 Container(
//                   child: Align(
//                     alignment: Alignment.bottomCenter,
//                     child: RaisedButton(
//                       color: Colors.blue[800],
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             new MaterialPageRoute(
//                                 builder: (context) => SelectInterests()));
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
//         )
