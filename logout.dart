// ignore_for_file: prefer_const_constructors

import 'package:abcc/Screens/Login_Doc/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class logout extends StatefulWidget {
  // const logout({Key? key}) : super(key: key);

  @override
  State<logout> createState() => _logoutState();
}

class _logoutState extends State<logout> {
  late SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
        // ignore: prefer_const_constructors
        builder: (BuildContext context) => LoginDoctor(),
      ));
      // (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 0,
      ),
      child: Stack(
        // ignore: avoid_unnecessary_containers
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0),
            child: IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                sharedPreferences.clear();
                // ignore: deprecated_member_use
                sharedPreferences.commit();
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => LoginDoctor(),
                  ),
                );
              },
              //  Text(
              //   "Log Out",
              //   style: TextStyle(
              //     color: Colors.black,
              //     fontSize: 14,
              //   ),
              // ),
            ),
          ),
          Text(
            'Log Out',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
