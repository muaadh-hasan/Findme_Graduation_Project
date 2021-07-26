import 'dart:io';

import 'package:findme_gp_project/models/user.dart';
import 'package:findme_gp_project/providers/user_provider.dart';
import 'package:findme_gp_project/screens/profile_screen.dart';
import 'package:findme_gp_project/widgets/relative_requests_widget.dart';
import 'package:findme_gp_project/widgets/your_photos_widget.dart';
import 'package:findme_gp_project/widgets/your_relatives_widget.dart';
import 'package:findme_gp_project/widgets/profile_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'map_screen.dart';
import 'tabs_screen.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, dynamic> _authData = {
    'name': '',
    'email': '',
    'password': '',
    'phone': ''
  };

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();

  bool isLandScape;

  @override
  Widget build(BuildContext context) {
    isLandScape = MediaQuery.of(context).orientation == Orientation.landscape;

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Stack(children: [
            Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Column(
                        children: [
                          Row(children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, bottom: 10),
                              child: Text(
                                "Welcome Back!",
                                style: TextStyle(
                                  fontFamily: 'Europa',
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        )),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: mainColor,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "SignUp",
                              style: TextStyle(
                                color: mainColor,
                                letterSpacing: 1.5,
                                fontSize:
                                    MediaQuery.of(context).size.height / 40,
                              ),
                            ),
                          ],
                        ),
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                _buildUserNameRow(),
                                _buildEmailRow(),
                                _buildPasswordRow(),
                                _buildPhoneRow(),
                                _buildSignUpButton(),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ])),
    );
  }

  Widget _buildEmailRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[200]),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            setState(() {
              _authData['email'] = value;
            });
          },
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.email,
                color: mainColor,
              ),
              border: InputBorder.none,
              labelText: 'E-mail'),
        ),
      ),
    );
  }

  Widget _buildUserNameRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[200]),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: TextFormField(
          controller: _nameController,
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            setState(() {
              _authData['name'] = value;
            });
          },
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.email,
                color: mainColor,
              ),
              border: InputBorder.none,
              labelText: 'User Name'),
        ),
      ),
    );
  }

  Widget _buildPasswordRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[200]),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: TextFormField(
          controller: _passwordController,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          onChanged: (value) {
            setState(() {
              _authData['password'] = value;
            });
          },
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: mainColor,
            ),
            border: InputBorder.none,
            labelText: 'Password',
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[200]),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: TextFormField(
          controller: _phoneController,
          keyboardType: TextInputType.number,
          onTap: () {},
          onChanged: (value) {
            setState(() {
              _authData['phone'] = value;
            });
          },
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.phone,
                color: mainColor,
              ),
              border: InputBorder.none,
              labelText: 'phone number'),
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.2 * (MediaQuery.of(context).size.height / 20),
          width: 3 * (MediaQuery.of(context).size.width / 10),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 3.0,
            color: mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () async {
              if (_nameController.text.isEmpty) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Please Enter Name")));
                return;
              }
              if (!reg.hasMatch(_emailController.text)) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Enter Valid Email")));
                return;
              }
              if (_passwordController.text.isEmpty ||
                  _passwordController.text.length < 6) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Password should be minimum 6 characters")));
                return;
              }
              bool check = await context.read<UserProvider>().signUp(
                    _authData['email'],
                    _authData['password'],
                    _authData['name'],
                    _authData['phone'],
                  );

              print(_authData);

              if (check == true) {
                print("check");
                print(check);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Sign up successfully!")));
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(new MaterialPageRoute(
                    builder: (BuildContext context) => TabsScreen()));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(context.read<UserProvider>().message)));
              }
            },
            child: Text(
              "SignUp",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 40,
              ),
            ),
          ),
        )
      ],
    );
  }
}
