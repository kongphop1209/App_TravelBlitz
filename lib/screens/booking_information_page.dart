import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:traveling_app/widget/ticket.dart';

class BookingInformation extends StatefulWidget {
  const BookingInformation({super.key});

  @override
  State<BookingInformation> createState() => _BookingInformationState();
}

class _BookingInformationState extends State<BookingInformation> {
  late DateTime selectedDate = DateTime.now();
  String _formatDate(DateTime date) {
    final today = DateFormat('E, MMM d');
    return today.format(date);
  }

  void _showDatePicker() async {
    final initialDate = selectedDate ?? DateTime.now();

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025).add(const Duration(days: 365)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light().copyWith(
              primary: Color.fromARGB(255, 0, 0, 0),
              onPrimary: Color.fromARGB(255, 255, 255, 255),
              surface: Color.fromARGB(255, 136, 251, 255),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void _confirmBooking() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Booking confirmed successfully!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String todayDate = DateFormat('E, MMM d').format(DateTime.now());
    String todayDate_datemonth = DateFormat('MMM d').format(DateTime.now());
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 148, 189, 250),
                    Color.fromARGB(255, 196, 229, 252)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.05,
                    horizontal: MediaQuery.of(context).size.width * 0.04),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 32, 32, 32)),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.white,
                    size: 20.w,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.13,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 40.w, top: 0.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Chiang Rai (CEI) to ",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color:
                                    const Color.fromARGB(255, 107, 107, 107)),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            "Bangkok (BKK)",
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 4.h, horizontal: 8.w),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 75, 75, 75),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  selectedDate != null
                                      ? _formatDate(selectedDate!)
                                      : _formatDate(DateTime.now()),
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromARGB(
                                        255, 252, 251, 251),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                ': 1 passenger : Economy',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(
                            255, 255, 255, 255), // Shape set to circle
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Container(
                        child: IconButton(
                          onPressed: _showDatePicker,
                          icon: const Icon(
                            Icons.calendar_today,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 30.h),
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.h,
                                horizontal: 10.w,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    _formatDate(selectedDate),
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'From ฿ 1,300',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 30.h),
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.h,
                                horizontal: 10.w,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(255, 0, 0, 0)),
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    _formatDate(
                                      selectedDate.add(
                                        const Duration(days: 1),
                                      ),
                                    ),
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'From ฿ 1,400',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 30.h),
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.h,
                                horizontal: 10.w,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(255, 0, 0, 0)),
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    _formatDate(
                                      selectedDate.add(
                                        const Duration(days: 2),
                                      ),
                                    ),
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'From ฿ 1,500',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 30.w, right: 30.w),
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.h,
                                horizontal: 10.w,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(255, 0, 0, 0)),
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    _formatDate(
                                      selectedDate.add(
                                        const Duration(days: 3),
                                      ),
                                    ),
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'From ฿ 1,600',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  child: Column(
                    children: [
                      const TicketPreview(
                          imagePath: "assets/images/nokair.png",
                          time: '13:30  - - - - -  14:50',
                          duration: 'CEI   1h 20m   BKK',
                          airline: 'Nok Air',
                          price: '฿ 1,815'),
                      SizedBox(
                        height: 10.h,
                      ),
                      const TicketPreview(
                          imagePath: "assets/images/vietjet.png",
                          time: '16:15  - - - - -  17:45',
                          duration: 'CEI   1h 30m   BKK',
                          airline: 'Thai Vietjet Air',
                          price: '฿ 1,665'),
                      SizedBox(
                        height: 10.h,
                      ),
                      const TicketPreview(
                          imagePath: "assets/images/airasia.png",
                          time: '20:25  - - - - -  21:50',
                          duration: 'CEI   1h 25m   BKK',
                          airline: 'Thai Airasia',
                          price: '฿ 1,531'),
                      SizedBox(
                        height: 10.h,
                      ),
                      const TicketPreview(
                          imagePath: "assets/images/vietjet.png",
                          time: '19:55  - - - - -  21:25',
                          duration: 'CEI   1h 30m   BKK',
                          airline: 'Thai Vietjet Air',
                          price: '฿ 1,595'),
                      SizedBox(
                        height: 10.h,
                      ),
                      const TicketPreview(
                          imagePath: "assets/images/airasia.png",
                          time: '20:55  - - - - -  22:20',
                          duration: 'CEI   1h 25m   BKK',
                          airline: 'Thai Airasia',
                          price: '฿ 1,632'),
                      SizedBox(
                        height: 10.h,
                      ),
                      const TicketPreview(
                          imagePath: "assets/images/nokair.png",
                          time: '14:55  - - - - -  16:15',
                          duration: 'CEI   1h 20m   BKK',
                          airline: 'Nok Air',
                          price: '฿ 1,791'),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
