import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteAccount_Page extends StatefulWidget {
  const DeleteAccount_Page({super.key});

  @override
  State<DeleteAccount_Page> createState() => _DeleteAccount_PageState();
}

class _DeleteAccount_PageState extends State<DeleteAccount_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete My Account'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Image.asset('assets/images/lolipop.png'),
              SizedBox(height: 20),
              Text(
                'Your Account Could Not be Deleted',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Sorry, your account could not be deleted because:'),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 35.0),
                child: Text(
                  'You changed the email linked to this account within the last 7 days',
                  style: TextStyle(fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
