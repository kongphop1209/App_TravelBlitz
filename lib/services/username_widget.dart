import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      if (FirebaseAuth.instance.currentUser != null) {
        final userId = FirebaseAuth.instance.currentUser!.uid;
        final userDocRef =
            FirebaseFirestore.instance.collection('users').doc(userId);

        DocumentSnapshot userSnapshot = await userDocRef.get();
        return userSnapshot;
      } else {
        throw Exception('User not authenticated');
      }
    } catch (e) {
      print('Error fetching user profile: $e');
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: _userProfileFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.hasData && snapshot.data != null) {
          var username = snapshot.data!['username'];
          return Text(
            '$username',
            style: widget.textStyle,
          );
        }
        return Text(
          'Username not found',
          style: widget.textStyle,
        );
      },
    );
  }
}
