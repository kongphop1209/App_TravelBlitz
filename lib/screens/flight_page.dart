import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveling_app/components/swap_trip.dart';

class FlightPage extends StatefulWidget {
  const FlightPage({Key? key}) : super(key: key);

  @override
  _FlightPageState createState() => _FlightPageState();
}

class _FlightPageState extends State<FlightPage> {
  String _selectedOption = 'One-way';
  @override
  void initState() {
    super.initState();
    _selectedOption = 'One-way';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 228, 228),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Image.asset(
                'assets/images/background_flight.png',
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          child: Image.asset('assets/images/back_icon.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 35.w),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 8.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.0),
                                      color: const Color.fromARGB(
                                          255, 202, 202, 202)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _selectedOption = 'One-way';
                                          });
                                        },
                                        child: AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 200),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 25.w,
                                            vertical: 5.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: _selectedOption == 'One-way'
                                                ? const Color.fromARGB(
                                                    255, 255, 255, 255)
                                                : null,
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                          child: Text(
                                            'One-way',
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  _selectedOption == 'One-way'
                                                      ? const Color.fromARGB(
                                                          255, 0, 0, 0)
                                                      : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _selectedOption = 'Round-trip';
                                          });
                                        },
                                        child: AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 200),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 25.w,
                                            vertical: 5.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                _selectedOption == 'Round-trip'
                                                    ? const Color.fromARGB(
                                                        255, 255, 255, 255)
                                                    : null,
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                          child: Text(
                                            'Round-trip',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15.sp,
                                              color: _selectedOption ==
                                                      'Round-trip'
                                                  ? const Color.fromARGB(
                                                      255, 0, 0, 0)
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                OptionTextWidget(
                                  selectedOption: _selectedOption,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 45.w),
                    alignment: AlignmentDirectional.centerStart,
                    child: Column(
                      children: [
                        Text(
                          'Discover your next adventure !',
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40.w),
                    alignment: AlignmentDirectional.centerStart,
                    child: Stack(
                      children: [
                        Container(
                          child: Image.asset('assets/images/minimap.png'),
                        ),
                        Container(
                          child: Positioned(
                            bottom: 1,
                            left: 1,
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              color: Colors.black.withOpacity(0.5),
                              child: Text(
                                'You',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 45.w),
                    alignment: AlignmentDirectional.centerStart,
                    child: Column(
                      children: [
                        Text(
                          'Deals 🔥',
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.only(
                            left: 40.w, bottom: 20.h, right: 10.w),
                        child: Container(
                          child: Row(
                            children: [
                              Image.asset('assets/images/banner_flight1.png'),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                              Image.asset('assets/images/banner_flight2.png'),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                              Image.asset('assets/images/banner_flight1.png'),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                              Image.asset('assets/images/banner_flight2.png'),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
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
          ],
        ),
      ),
    );
  }
}
