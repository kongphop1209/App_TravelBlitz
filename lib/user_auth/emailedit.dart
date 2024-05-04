import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Email_Page extends StatefulWidget {
  const Email_Page({super.key});

  @override
  State<Email_Page> createState() => _Email_PageState();
}

class _Email_PageState extends State<Email_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Email'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 50.0, right: 30.0),
          child: Column(
            children: [
              Text(
                'Your Email will show when you add reviews or other user content to the site.',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text('Email'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Your Email must be under 50 characters and cannot contain emotions or speacial characters.',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
