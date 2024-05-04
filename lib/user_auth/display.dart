import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayName_page extends StatefulWidget {
  const DisplayName_page({super.key});

  @override
  State<DisplayName_page> createState() => _DisplayName_pageState();
}

class _DisplayName_pageState extends State<DisplayName_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display name'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 50.0, right: 30.0),
          child: Column(
            children: [
              Text(
                'Your display name will show on Lywing when you add reviews or other user content to the site. Other users will only see your display name and not your account name or real name.',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text('Display name'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Display names must be under 50 characters and cannot contain emotions or speacial characters.',
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
