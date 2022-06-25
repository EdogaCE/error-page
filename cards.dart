// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:abcc/Dashboard/Doctor/bottom_nav.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  // SubscriptionScreen({Key? key}) : super(key: key);
  // final numbers = List.generate(100, (index) => '$index');

  @override
  Widget build(BuildContext context) => Container(
        height: 280,
        width: 300,
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          padding: EdgeInsets.all(16),
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.cyan, borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.all(10),
              child: GridTile(
                header: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    Text('Urgent Medical Consult')
                  ],
                ),
                child: Text(''),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(192, 236, 238, 97),
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.all(10),
              child: GridTile(
                header: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          // side: BorderSide(color: Colors.red),
                        ),
                      ),
                      onPressed: () {},
                      child: Text('🩺'),
                    ),
                    Text('My Doctors')
                  ],
                ),
                child: Text(''),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(183, 255, 108, 135),
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.all(10),
              child: GridTile(
                header: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.subscriptions,
                        color: Colors.white,
                      ),
                    ),
                    Text('Check Subscription')
                  ],
                ),
                child: Text(''),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(131, 99, 246, 153),
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.all(10),
              child: GridTile(
                header: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.calendar_view_day,
                        color: Colors.white,
                      ),
                    ),
                    Text('Check Appointment')
                  ],
                ),
                child: Text(''),
              ),
            ),
          ],
        ),
      );

  // Widget buildNumber(String number) => Container(
  //       padding: EdgeInsets.all(16),
  //       color: Colors.blue.withOpacity(9),
  //       child: GridTile(
  //         header: Text(
  //           "header $number",
  //           textAlign: TextAlign.center,
  //         ),
  //         child: Center(
  //           child: Text(
  //             number,
  //             style: TextStyle(
  //               fontWeight: FontWeight.bold,
  //               fontSize: 20,
  //             ),
  //             textAlign: TextAlign.center,
  //           ),
  //         ),
  //         footer: Text(
  //           "footer $number",
  //           textAlign: TextAlign.center,
  //         ),
  //       ),
  //     );
}
