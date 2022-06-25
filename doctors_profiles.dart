// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class Doctors {
  String imageUrl;
  // List<String> detailUrl;
  Doctors(this.imageUrl);
  static List<Doctors> generateDoctors() {
    return [
      Doctors(
        'assets/images/doc.jpg',
        // ['assets/images/doctor2'],
      ),
      Doctors(
        'assets/images/doctor2.jpg',
        // ['assets/images/doctor2'],
      ),
      Doctors(
        'assets/images/doctor3.jpg',
        // ['assets/images/doctor2'],
      ),
      Doctors(
        'assets/images/doctor4.jpg',
        // ['assets/images/doctor2'],
      ),
      Doctors(
        'assets/images/doctor5.jpg',
        // ['assets/images/doctor2'],
      ),
      Doctors(
        'assets/images/doctor6.jpg',
        // ['assets/images/doctor2'],
      ),
      Doctors(
        'assets/images/doc.jpg',
        // ['assets/images/doctor2'],
      ),
    ];
  }
}

class DoctorsProfile extends StatelessWidget {
  // DoctorsProfile({Key? key}) : super(key: key);
  final Doctors doctors;
  // ignore: prefer_const_constructors_in_immutables
  DoctorsProfile(this.doctors);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(8),
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
                            AssetImage(doctors.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
