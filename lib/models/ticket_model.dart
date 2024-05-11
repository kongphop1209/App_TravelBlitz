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
        .collection('booking_1')
        .doc('detail-flight')
        .set(bookingData)
        .then((value) {
      print('Booking added successfully!');

      Navigator.of(context).pop();
    }).catchError((error) {
      print('Failed to add booking: $error');
    });
  }
}
