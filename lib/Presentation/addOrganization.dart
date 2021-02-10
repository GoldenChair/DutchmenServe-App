import 'package:dutchmenserve/Infrastructure/cubit/organization_cubit.dart';
import 'package:dutchmenserve/Infrastructure/repository.dart';
import 'package:dutchmenserve/Presentation/buttons.dart';
import 'package:dutchmenserve/models/organization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOrgPage extends StatefulWidget {
  AddOrgPage({Key key}) : super(key: key);

  @override
  _AddOrgState createState() {
    return _AddOrgState();
  }
}

class _AddOrgState extends State<AddOrgPage> {
  final _newOrgFormKey = GlobalKey<FormState>();

  final orgName = TextEditingController();
  final orgDescription = TextEditingController();
  final orgEmail = TextEditingController();

  @override
  void dispose() {
    orgName.dispose();
    orgDescription.dispose();
    orgEmail.dispose();
    super.dispose();
  }

  // Textfield decoration
  InputDecoration decor(String labelText, FocusScopeNode focusNode) {
    return InputDecoration(
      isDense: true,
      filled: true,
      fillColor: Color(0xfff9f9f9),
      labelText: labelText,
      alignLabelWithHint: true,
      labelStyle: TextStyle(
        fontSize: 16,
        color: Colors.grey[700],
      ),
      errorStyle:
          focusNode.hasFocus ? TextStyle(fontSize: 0, height: 0) : TextStyle(),
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrganizationCubit>(
      create: (context) => OrganizationCubit(),
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Form(
            key: _newOrgFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text('New Organization'),
                  floating: true,
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        Spacer(flex: 1),
                        TextFormField(
                          controller: orgName,
                          decoration: decor(
                              'Organization Name', FocusScope.of(context)),
                          validator: (value) {
                            if (value.isEmpty) {
                              return '*required';
                            }
                            return null;
                          },
                        ),
                        Flexible(
                          flex: 3,
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.bottom,
                            expands: true,
                            controller: orgDescription,
                            keyboardType: TextInputType.multiline,
                            minLines: null,
                            maxLines: null,
                            maxLength: 100,
                            maxLengthEnforced: true,
                            decoration:
                                decor('Description', FocusScope.of(context)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return '*required';
                              }
                              if (value.length > 100) {
                                return 'Exceeded 100 characters';
                              }
                              if (value.contains('\n'))
                                return 'Keep description in one line';
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: TextFormField(
                            controller: orgEmail,
                            decoration: decor('Email', FocusScope.of(context)),
                            validator: (value) {
                              if (value.isNotEmpty && !value.contains('@'))
                                return 'Missing the @ char';
                              return null;
                            },
                          ),
                        ),
                        ListTile(
                          // tileColor: Colors.white,
                          leading: Icon(Icons.add_a_photo),
                          title: Text('Profile'),
                          trailing: FlatButton(
                            color: Colors.grey[200],
                            child: Text('Upload'),
                            onPressed: () {
                              //TODO: implement adding photos
                            },
                          ),
                        ),
                        Spacer(flex: 1),
                        NormalButton(
                          'Submit',
                          () {
                            if (_newOrgFormKey.currentState.validate()) {
                              // TODO: save new Org in DB
                              Organization newOrg = Organization(
                                orgName.text, orgDescription.text,
                                email: orgEmail.text, //TODO: image path
                              );

                              FocusScope.of(context).unfocus();
                              Navigator.pop(context);
                            }
                          },
                        ),
                        Spacer(flex: 1),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void submitOrganization(BuildContext context, Organization org) {
  //   //final orgCubit;
  //   final orgCubit = context.watch<OrganizationCubit>();
  //   orgCubit.addOrg(org);
  // }
}
