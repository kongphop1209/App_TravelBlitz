import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularPageViewPop extends StatelessWidget {
  final String assetImagePath;
  final String title;
  final String subtitle;
  final EdgeInsets margin;
  final Color? titleColor;
  final Color? subtitleColor;

  const PopularPageViewPop({
    required this.assetImagePath,
    required this.title,
    required this.subtitle,
    required this.margin,
    this.titleColor,
    this.subtitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 1.3,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assetImagePath),
          fit: BoxFit.fill,
        ),
      ),
      child: Container(
        margin: margin,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w800,
                      color: subtitleColor ?? Colors.black,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: subtitleColor ?? Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
