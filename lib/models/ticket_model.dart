import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirebaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addBookingToFirestore(
    BuildContext context,
    String username,
    String time,
    String duration,
    String airline,
    String price,
  ) {
    Map<String, dynamic> bookingData = {
      'username': username,
      'time': time,
      'duration': duration,
      'airline': airline,
      'price': price,
      'timestamp': FieldValue.serverTimestamp(),
    };

    FirebaseFirestore.instance
        .collection('bookings')
        .add(bookingData)
        .then((value) {
      print('Booking added successfully!');

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text('Confirmation'),
            content: Text(
                'Your booking has been confirmed. Please check in your booking.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
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
      Navigator.of(context).pop();
    }).catchError((error) {
      print('Failed to add booking: $error');
    });
  }
}
