import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPassword_Page extends StatefulWidget {
  const ResetPassword_Page({super.key});

  @override
  State<ResetPassword_Page> createState() => _ResetPassword_PageState();
}

class _ResetPassword_PageState extends State<ResetPassword_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset password'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 50.0, right: 30.0),
          child: Column(
            children: [
              Text(
                'Please enter a new password. It must be 8-20 characters and include numbers and symbols',
                style: TextStyle(fontSize: 15, color: Color(0xFF3C3C43)),
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text(
                    'Password',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text(
                    'New Password',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFF007AFF),
                    borderRadius: BorderRadius.circular(12)),
                width: 350,
                height: 50,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  onPressed: () {},
                  child: Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 110,
                        ),
                        Text(
                          'Save',
                          style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 2.2,
                              color: Colors.white),
                        ),
                      ],
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
