import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  NavBar({super.key, this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(0, 9, 134, 1),
            Color.fromARGB(255, 40, 73, 223)
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: GNav(
          color: Color.fromARGB(255, 255, 255, 255),
          activeColor: Colors.black,
          tabActiveBorder: Border(
            top: BorderSide.none,
            bottom: BorderSide.none,
            left: BorderSide.none,
            right: BorderSide.none,
          ),
          tabBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          tabBorderRadius: 100,
          onTabChange: (value) => onTabChange!(value),
          tabs: [
            GButton(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.0.w),
              icon: Icons.explore,
              text: ' HOME',
            ),
            GButton(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.0.w),
              icon: Icons.luggage,
              text: ' TRIP',
            ),
            GButton(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.0.w),
              text: ' PROFILE',
              icon: Icons.person,
            ),
          ]),
    );
  }
}
