import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveling_app/services/username_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
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
                              UsernameShow(
                                textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromARGB(255, 0, 0, 0),
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
                            width: MediaQuery.of(context).size.width * 0.04,
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
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 155, 155, 155).withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 1),
                      ),
                    ],
                    color: Colors.white),
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
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
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                              Text(
                                'Customize',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
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
                                  Icons.notifications,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                              Text(
                                'Notifications',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
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
                                  Icons.card_giftcard_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                              Text(
                                'Coupon',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
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
                                  Icons.favorite,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                              Text(
                                'Saved flight',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500),
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
      ),
    );
  }
}
