import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveling_app/services/firebase_auth/firebase_auth_services.dart';
import 'package:traveling_app/widget/container_widget.dart';

class ResetPassword_Page extends StatefulWidget {
  const ResetPassword_Page({Key? key}) : super(key: key);

  @override
  State<ResetPassword_Page> createState() => _ResetPassword_PageState();
}

class _ResetPassword_PageState extends State<ResetPassword_Page> {
  bool isLoading = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> resetPasswordSection() async {
    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password reset link has been sent! Check your email.'),
          duration: Duration(seconds: 5),
        ),
      );
    } on FirebaseAuthException catch (e) {
      print(e);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'An error occurred'),
          duration: Duration(seconds: 3),
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  String? _emailError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please enter your email to receive a password reset link.',
              style: TextStyle(fontSize: 15.sp, color: Color(0xFF3C3C43)),
            ),
            SizedBox(height: 20.h),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: _emailError,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: resetPasswordSection,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF007AFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Confirm',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        letterSpacing: 2.2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
