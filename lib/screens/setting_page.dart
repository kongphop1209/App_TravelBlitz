import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:traveling_app/auth_page/login_page.dart';
import 'package:traveling_app/main_page.dart';
import 'package:traveling_app/services/username_widget.dart';
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
      backgroundColor: Color.fromRGBO(241, 247, 255, 1),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UsernameShow(
                            textStyle: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Text(
                            'Edit personal information',
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color:
                                    const Color.fromARGB(255, 167, 167, 167)),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/user.png',
                        width: 50.w,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    margin: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Email_Page(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Icon(Icons.email_outlined),
                                SizedBox(
                                  width: 10.h,
                                ),
                                Text(
                                  'My Email',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainPage(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Icon(Icons.edit_outlined),
                                SizedBox(
                                  width: 10.h,
                                ),
                                Text(
                                  'Display Name',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainPage(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Icon(Icons.lock_outline),
                                SizedBox(
                                  width: 10.h,
                                ),
                                Text(
                                  'Reset Password',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              children: [
                                Icon(Icons.delete_outline_rounded),
                                SizedBox(
                                  width: 10.h,
                                ),
                                Text(
                                  'Delete My Account',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    color: Color.fromARGB(255, 215, 225, 240),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          child: Row(
                            children: [
                              Icon(
                                Icons.logout_outlined,
                                color: Color.fromARGB(255, 255, 118, 108),
                              ),
                              SizedBox(
                                width: 10.w,
                
                              ),
                              Container(
                                height: 20.w,
                                child: GestureDetector(
                                  onTap: () {
                                    FirebaseAuth.instance.signOut();
                                    Navigator.pushNamed(context, '/login');
                                  },
                                  child: Text(
                                    'Sign Out',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromARGB(255, 255, 118, 108),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
