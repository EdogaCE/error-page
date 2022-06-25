// ignore_for_file: prefer_const_constructors

import 'package:abcc/Dashboard/Doctor/custom-app-bar.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class BottomNav extends StatefulWidget {
  // BottomNav(Key key, this.title) : super(key: key);
  // final String title;

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  // This navigator state will be used to navigate different pages
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int currentIndex = 0;
  final screens = [
    CustomAppBar(),
    Center(
        child: Text(
      "data",
      style: TextStyle(fontSize: 60),
    )),
    Center(
        child: Text(
      "data",
      style: TextStyle(fontSize: 60),
    )),
    Center(
        child: Text(
      "data",
      style: TextStyle(fontSize: 60),
    )),
    Center(
        child: Text(
      "data",
      style: TextStyle(fontSize: 60),
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black26,
      // ignore: prefer_const_literals_to_create_immutables
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: "Appointments",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble),
          label: "Chats",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Settings",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: "Account",
        ),
      ],
    );
  }

  // _onTap(int tabIndex, rootNavigator: true) {
  //   switch (tabIndex) {
  //     case 0:
  //       _navigatorKey.currentState!.pushReplacementNamed("Home");
  //       break;
  //     case 1:
  //       _navigatorKey.currentState!.pushReplacementNamed("Appointments");
  //       break;
  //     case 2:
  //       _navigatorKey.currentState!.pushReplacementNamed("Chats");
  //       break;
  //     case 3:
  //       _navigatorKey.currentState!.pushReplacementNamed("Settings");
  //       break;
  //     case 4:
  //       _navigatorKey.currentState!.pushReplacementNamed("Account");
  //       break;
  //   }
  //   setState(() {
  //     _currentTabIndex = tabIndex;
  //   });
  // }

  // Route<dynamic> generateRoute(RouteSettings settings) {
  //   switch (settings.name) {
  //     case "Account":
  //       return MaterialPageRoute(
  //           builder: (context) => Container(
  //               color: Colors.blue, child: Center(child: Text("Account"))));
  //     case "Settings":
  //       return MaterialPageRoute(
  //           builder: (context) => Container(
  //               color: Colors.green, child: Center(child: Text("Settings"))));
  //     case "Appointments":
  //       return MaterialPageRoute(
  //           builder: (context) => Container(
  //               color: Colors.green, child: Center(child: Text("Settings"))));
  //     case "Chats":
  //       return MaterialPageRoute(
  //           builder: (context) => Container(
  //               color: Colors.green, child: Center(child: Text("Settings"))));
  //     default:
  //       return MaterialPageRoute(
  //         builder: (BuildContext context) => CustomAppBar(),
  //       );
  // }
  // }
}
