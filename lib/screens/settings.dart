import 'dart:io';
import 'package:findme_gp_project/providers/user_provider.dart';
import 'package:findme_gp_project/screens/profile_screen.dart';
import 'package:findme_gp_project/widgets/chats_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../constants.dart';
import '../constants.dart';
import '../data.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool opacityOfAppBar = true;

  String email, userName, password, phone, location;
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _locationController = new TextEditingController();

  Map<String, dynamic> _editedData = {
    'email': '',
    'user_name': '',
    'password': '',
    'phone': '',
    'location': '',
    'image_profile': ''
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff60aad2),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: ListView(
              padding: EdgeInsets.only(top: 0.0),
              children: [
                Container(
                  color: const Color(0xff60aad2),
                  child: customAppBar(context),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 16,
            child: Container(
              height: MediaQuery.of(context).size.height * .10,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(246, 246, 246, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .010),
                child: Column(
                  children: [
                    Row(
                      children: [
                        /*  Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              child: GestureDetector(
                                child: Icon(Icons.arrow_back),
                              ),
                              margin: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * .060),
                            ),
                          ),
                        ),
                        */
                        Expanded(
                          flex: 22,
                          child: Text(
                            "Settings",
                            style: TextStyle(
                              fontFamily: 'Europa',
                              fontSize: 30,
                              color: const Color(0xff334856),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundImage:
                                  AssetImage("assets/images/pic4.jpg"),
                            ),
                          ),
                          _infoBox(context),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoBox(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          //  color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: ListView(
          children: [
            _buildUserNameRow(),
            _buildEmailRow(),
            _buildPasswordRow(),
            _buildPhoneRow(),
            _buildLocationRow(),
            _buildSaveButton(context),
          ],
        ));
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
          initialValue: currentUser.email,
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            setState(() {
              email = value;
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
          initialValue: currentUser.username,
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            setState(() {
              _editedData['email'] = value;
            });
          },
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.email,
                color: mainColor,
              ),
              border: InputBorder.none,
              labelText: 'User_name'),
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
          initialValue: currentUser.password,
          controller: _passwordController,
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          onChanged: (value) {
            setState(() {
              _editedData['password'] = value;
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
          initialValue: currentUser.phone,
          controller: _phoneController,
          keyboardType: TextInputType.phone,
          onTap: () {},
          onChanged: (value) {
            setState(() {
              _editedData['phone'] = value;
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

  Widget _buildLocationRow() {
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
          initialValue: currentUser.location,
          controller: _locationController,
          keyboardType: TextInputType.text,
          onChanged: (value) {
            setState(() {
              _editedData['location'] = value;
            });
          },
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.location_city,
                color: mainColor,
              ),
              border: InputBorder.none,
              labelText: 'Location'),
        ),
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
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
              if (!reg.hasMatch(_emailController.text)) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Enter Valid Email")));
                return;
              }

              String check = await context.read<UserProvider>().editSettings(
                    email: _emailController.text,
                    userName: _userNameController.text,
                    password: _passwordController.text,
                    phone: _phoneController.text,
                    location: _locationController.text,
                    image:
                        context.watch<UserProvider>().imageProfile.toString(),
                  );

              print("Data ***********************");
              print(_emailController.text);
              print(_userNameController.text);
              print(_passwordController.text);
              print(context.watch<UserProvider>().imageProfile.toString());

              print("check ***********************");
              print(check);
              if (check == "true") {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Data updated successfully!")));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Failed!!!, try again.")));
              }
            },
            child: Text(
              "Save",
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

  Widget customAppBar(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height *.6,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .060,
                    //left: MediaQuery.of(context).size.width * .010,
                  ),
                  child: Image(
                    height: MediaQuery.of(context).size.height * .08,
                    image: const AssetImage('assets/images/new_logo.png'),
                  ),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  child: GestureDetector(
                      child: largeProfileImage(context),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(
                                builder: (BuildContext context) => Profile()));
                      }),
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .073,
                      right: MediaQuery.of(context).size.width * .015),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.end,
            ),
          ),
        ],
      ),
    );
  }
}
