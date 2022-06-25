// ignore: file_names
// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:abcc/Dashboard/Doctor/bottom_nav.dart';
import 'package:abcc/Dashboard/Doctor/cards.dart';
import 'package:abcc/Dashboard/Doctor/doctors_profiles.dart';
import 'package:abcc/Dashboard/Doctor/new_doctors.dart';
import 'package:abcc/Log%20Out/logout.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top, left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        child: InkWell(
                          onTap: () {}, // Handle your callback.
                          splashColor: Colors.brown.withOpacity(0.5),
                          child: Ink(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              // ignore: prefer_const_constructors
                              image: DecorationImage(
                                image:
                                    // ignore: prefer_const_constructors
                                    AssetImage("assets/images/doctor_face.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Image.asset("assets/images/doctor_face.jpg"),
                    ],
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      // ignore: prefer_const_constructors
                      Text(
                        "Welcome",
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 15,
                      ),
                      // ignore: prefer_const_constructors
                      Text(
                        "Daniel",
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    width: 20,
                  ),
                  Stack(
                    children: [
                      Container(
                        // ignore: prefer_const_constructors
                        child: Icon(Icons.format_align_right),
                      )
                    ],
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    width: 5,
                  ),
                  Stack(
                    children: [
                      Container(
                        // ignore: prefer_const_constructors
                        child: InkWell(
                          onTap: () {},
                          child: Ink(
                            child: const Icon(Icons.notifications),
                          ),
                        ),
                      )
                    ],
                  ),
                  // ignore: prefer_const_constructors
                  logout(),
                ],
              ),
            ),
            const SizedBox(
              height: 55,
            ),

            // padding: const EdgeInsets.only(left: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Stack(children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(241, 231, 222, 222),
                  ),
                  child: InkWell(
                    // splash color
                    onTap: () {}, // button pressed
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const Icon(Icons.call),
                        const SizedBox(
                          width: 8,
                        ), // icon
                        const Text("Consult"), // text
                      ],
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                width: 35,
              ),
              Stack(children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // ignore: prefer_const_constructors
                      color: Color.fromARGB(241, 231, 222, 222),
                    ),
                    child: InkWell(
                      // splash color
                      onTap: () {}, // button pressed
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          // ignore: prefer_const_constructors
                          Padding(
                            // ignore: prefer_const_constructors
                            padding: EdgeInsets.all(8.0),
                            child: const Icon(Icons.calendar_today),
                          ),
                          const SizedBox(
                            width: 8,
                          ), // icon
                          const Text("Book"), // text
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ]),
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Doctors Profiles",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 100,
                ),
                InkWell(
                  onTap: () {},
                  child: Ink(
                    child: const Icon(Icons.menu_rounded),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            NewDoctors(),
            const SizedBox(
              height: 3,
            ),
            Cards(),
          ],
        ),
      ),
    );
  }
}
