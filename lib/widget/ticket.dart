import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketPreview extends StatefulWidget {
  final String imagePath;
  final String time;
  final String duration;
  final String airline;
  final String price;
  final VoidCallback? onBookPressed;

  const TicketPreview({
    Key? key,
    required this.imagePath,
    required this.time,
    required this.duration,
    required this.airline,
    required this.price,
    this.onBookPressed,
  }) : super(key: key);

  @override
  State<TicketPreview> createState() => _TicketPreviewState();
}

class _TicketPreviewState extends State<TicketPreview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            widget.imagePath,
            width: 60.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.time,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  widget.duration,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  widget.airline,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 37, 37, 37),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.price,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 13.sp,
                ),
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Text('Confirmation'),
                        content: Text(
                            'Your booking has been confirmed. please check in your booking.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 8.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue),
                              child: Text(
                                'OK',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Text(
                    'Book',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
