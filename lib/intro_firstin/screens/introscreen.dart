import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traveling_app/auth_page/login_page.dart';

import 'package:traveling_app/intro_firstin/controller/intro_controller.dart';
import 'package:traveling_app/intro_firstin/widget/widget_dot_navigator.dart';
import 'package:traveling_app/intro_firstin/widget/widget_nextbutton.dart';
import 'package:traveling_app/intro_firstin/widget/widget_onscreens.dart';
import 'package:traveling_app/intro_firstin/widget/widget_skip.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(IntroController());
    return FutureBuilder<bool>(
      future: _shouldShowIntro(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.data == true) {
          return _buildIntroScreen(controller);
        } else {
          return const LoginPage(); // Navigate to the login page if intro screens were shown before
        }
      },
    );
  }

  Widget _buildIntroScreen(IntroController controller) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.symmetric(horizontal: 30.w),
            child: PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: const [
                WidgetIntro(
                  image: 'assets/images/aboard.gif',
                  title: 'Welcome',
                  subtitle:
                      "Start your journey with us and explore amazing destinations around the world!",
                ),
                WidgetIntro(
                  image: 'assets/images/airplane-dukdik.gif',
                  title: 'Trust',
                  subtitle:
                      "Your trust is our top priority. We are committed to providing a secure and reliable travel experience for you.",
                ),
                WidgetIntro(
                  image: 'assets/images/arrives.gif',
                  title: 'Explore',
                  subtitle:
                      "Start exploring the world with us today and turn your travel dreams into reality. Let's make every journey an unforgettable adventure together!",
                ),
              ],
            ),
          ),
          const WidgetSkip(),
          const WidgetNavigator(),
          const NextButton(),
        ],
      ),
    );
  }

  Future<bool> _shouldShowIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? hasSeenIntro = prefs.getBool('hasSeenIntro');
    return hasSeenIntro ?? true;
  }
}
