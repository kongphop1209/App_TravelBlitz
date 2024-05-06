import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveling_app/auth_page/login_page.dart';
import 'package:traveling_app/user_auth/delete.dart';
import 'package:traveling_app/user_auth/display.dart';
import 'package:traveling_app/user_auth/emailedit.dart';
import 'package:traveling_app/user_auth/resetpass.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xFFF5F7FA),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: SizedBox(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Image.asset(
                        'assets/images/back_icon.png',
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Username',
                                style: TextStyle(fontSize: 20.sp),
                              ),
                              Text(
                                'Edit personal infomations',
                                style: TextStyle(
                                  color: Color(0xFF3C3C43),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.sp),
                            child: Image.asset('assets/images/proflie.png'),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 80.h,
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigate to email page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Email_Page()),
                          );
                        },
                        child: Row(
                          children: [
                            Container(
                              child: Image.asset('assets/images/mail.png'),
                            ),
                            SizedBox(
                              width: 10.w,
                              height: 50.h,
                            ),
                            Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                children: [
                                  Text(
                                    " My Email ",
                                    style: TextStyle(fontSize: 20.sp),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to display name page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DisplayName_page()),
                          );
                        },
                        child: Row(
                          children: [
                            Container(
                              child: Image.asset('assets/images/create.png'),
                            ),
                            SizedBox(
                              width: 10,
                              height: 50,
                            ),
                            Text(
                              'Display Name',
                              style: TextStyle(fontSize: 20.sp),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to reset password page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResetPassword_Page()),
                          );
                        },
                        child: Row(
                          children: [
                            Container(
                              child: Image.asset('assets/images/locker.png'),
                            ),
                            SizedBox(
                              width: 10.w,
                              height: 50.h,
                            ),
                            Text(
                              'Reset Password',
                              style: TextStyle(fontSize: 20.sp),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to delete account page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DeleteAccount_Page()),
                          );
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            Container(
                              child: Image.asset('assets/images/bin.png'),
                            ),
                            SizedBox(
                              width: 10.w,
                              height: 50.h,
                            ),
                            Text(
                              'Delete My Account',
                              style: TextStyle(fontSize: 20.sp),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 80.h),
                child: Container(
                  width: 350.w,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 70.w,
                          ),
                          Container(
                            child: Image.asset('assets/images/exit.png'),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'Sign Out',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                letterSpacing: 2.2,
                                color: Color(0xFFC0C4CC)),
                          ),
                        ],
                      ),
                    ),
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
