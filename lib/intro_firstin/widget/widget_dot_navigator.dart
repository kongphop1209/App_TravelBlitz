import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:traveling_app/intro_firstin/controller/intro_controller.dart';

class WidgetNavigator extends StatelessWidget {
  const WidgetNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = IntroController.instance;

    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.1,
      left: MediaQuery.of(context).size.width * 0.1,
      child: SmoothPageIndicator(
        count: 3,
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(
            activeDotColor: Colors.blue, dotHeight: 8.h, dotWidth: 15.w),
      ),
    );
  }
}
