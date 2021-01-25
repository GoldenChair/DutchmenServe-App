import 'package:dutchmenserve/Infrastructure/cubit/users_cubit.dart';
import 'package:dutchmenserve/Presentation/buttons.dart';
import 'package:dutchmenserve/Presentation/initialHomePage.dart';
import 'package:dutchmenserve/Presentation/interestSelection.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
This class will prompt for a username and password and for password 
confirmation for registration purposes
*/

class UserNameReg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register an account'),
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
      body: BlocProvider(
        create: (context) => UsersCubit(),
        child: RegisterForm(),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.

  // Note: This is a `GlobalKey<FormState>`, not a GlobalKey<MyCustomFormState>.
  final _registerFormKey = GlobalKey<FormState>();

  // text controller to retrieve textfield value
  final unController = TextEditingController();
  final pwController = TextEditingController();
  // final fnController = TextEditingController();
  // final lnController = TextEditingController();

  @override
  void dispose() {
    unController.dispose();
    pwController.dispose();
    // fnController.dispose();
    // lnController.dispose();
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
    // Build a Form widget using the _formKey created above.
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Form(
        key: _registerFormKey,
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
                        if (_registerFormKey.currentState.validate()) {
                          // and database verifies LVC user login
                          // get user info (first name, last name)
                          String fn = 'First';
                          String ln = 'Last';

                          // save new User in DB
                          User u = User(
                              fn, ln, unController.text, pwController.text);

                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          // Scaffold.of(context).showSnackBar(
                          //     SnackBar(content: Text('Account verified')));

                          SystemChrome.setSystemUIOverlayStyle(
                              SystemUiOverlayStyle(
                            statusBarColor: Color(0xff002A4E),
                            systemNavigationBarColor: Color(0xfff9f9f9),
                            systemNavigationBarIconBrightness: Brightness.dark,
                          ));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SelectInterests(user: u)));
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
