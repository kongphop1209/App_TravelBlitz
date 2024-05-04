import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveling_app/components/nav_bar.dart';
import 'package:traveling_app/screens/home_page.dart';
import 'package:traveling_app/screens/mytrip_page.dart';
import 'package:traveling_app/screens/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  final List<Widget> _pages = [
    const HomePage(),
    const MyTripPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: _pages[_selectedIndex],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 65.h, // Adjust the height as needed
              child: NavBar(
                onTabChange: (index) => navigateBottomBar(index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
