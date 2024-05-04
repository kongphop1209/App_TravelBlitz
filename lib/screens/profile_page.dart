import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'This user is Handsome',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Chiang Rai - CEI',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                  ),
                                ),
                                Icon(
                                  Icons.location_on,
                                  size: 15.sp,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Image.asset(
                          'assets/images/user.png',
                          width: 50.w,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    ),
                  ],
                  color: Color.fromARGB(255, 231, 231, 231)),
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 85, 85, 85)),
                              child: Icon(
                                Icons.person_2_sharp,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Customize',
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 85, 85, 85)),
                              child: Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Notifications',
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 85, 85, 85),
                              ),
                              child: Icon(
                                Icons.card_giftcard_rounded,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Coupon',
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 85, 85, 85),
                              ),
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Saved flight',
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
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
