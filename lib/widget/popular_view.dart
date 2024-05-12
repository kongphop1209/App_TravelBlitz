import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularPageViewPop extends StatefulWidget {
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
  _PopularPageViewPopState createState() => _PopularPageViewPopState();
}

class _PopularPageViewPopState extends State<PopularPageViewPop> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 1.3,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.assetImagePath),
          fit: BoxFit.fill,
        ),
      ),
      child: Container(
        margin: widget.margin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w800,
                      color: widget.subtitleColor ?? Colors.black,
                    ),
                  ),
                  Text(
                    widget.subtitle,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: widget.subtitleColor ?? Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.h),
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Icon(
                    Icons.favorite,
                    color: _isFavorite ? Colors.red : Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
