import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UsernameShow extends StatefulWidget {
  final Color? color;
  final TextStyle? textStyle;

  const UsernameShow({Key? key, this.color, this.textStyle}) : super(key: key);

  @override
  State<UsernameShow> createState() => _UsernameShowState();
}

class _UsernameShowState extends State<UsernameShow> {
  late Future<DocumentSnapshot> _userProfileFuture;

  @override
  void initState() {
    super.initState();
    _userProfileFuture = _getUserProfile();
  }

  Future<DocumentSnapshot> _getUserProfile() async {
    try {
      // Check if the user is authenticated
      if (FirebaseAuth.instance.currentUser != null) {
        final userId = FirebaseAuth.instance.currentUser!.uid;
        final userDocRef =
            FirebaseFirestore.instance.collection('users').doc(userId);

        // Get the document snapshot
        DocumentSnapshot userSnapshot = await userDocRef.get();
        return userSnapshot;
      } else {
        throw Exception('User not authenticated');
      }
    } catch (e) {
      print('Error fetching user profile: $e');
      throw e; // Rethrow the error to be caught by the caller
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: _userProfileFuture, // Use the Future initialized in initState
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show loading indicator while data is loading
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.hasData && snapshot.data != null) {
          var username = snapshot.data!['username'];
          return Text(
            '$username', // Replace with the username
            style: widget.textStyle,
          );
        }
        return Text(
          'Username not found', // Show default message if username is not found
          style: widget.textStyle,
        );
      },
    );
  }
}
