import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveling_app/screens/setting_page.dart';

class MyTripPage extends StatefulWidget {
  const MyTripPage({super.key});

  @override
  State<MyTripPage> createState() => _MyTripPageState();
}

class _MyTripPageState extends State<MyTripPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/user.png',
                                        width: 50.w,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                              Icon(
                                                Icons.location_on,
                                                size: 15.sp,
                                                color: Colors.red,
                                              ),
                                              Text(
                                                'Chiang Rai - CEI',
                                                style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SettingPage()));
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.w),
                                color: Color.fromARGB(255, 61, 61, 61),
                              ),
                              child: Icon(
                                Icons.settings,
                                color: Colors.white,
                                size: 25.sp,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Image.asset('assets/images/information1.png'),
                      SizedBox(
                        height: 10.h,
                      ),
                      Image.asset('assets/images/duoinformation.png'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
