import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DisplayNamePage extends StatefulWidget {
  const DisplayNamePage({Key? key}) : super(key: key);

  @override
  _DisplayNamePageState createState() => _DisplayNamePageState();
}

class _DisplayNamePageState extends State<DisplayNamePage> {
  final TextEditingController _usernameController = TextEditingController();
  String? _usernameError;

  Future<void> _updateUsername() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final username = _usernameController.text.trim();

      if (username.isEmpty || username.length > 16) {
        setState(() {
          _usernameError = 'Username must be between 1 and 16 characters.';
        });
        return;
      } else {
        setState(() {
          _usernameError = null;
        });
      }

      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({'username': username});

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Username updated successfully!'),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update username. Please try again.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Username'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter a new username. Usernames must be unique and can contain alphanumeric characters and underscores.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                errorText: _usernameError,
              ),
              maxLength: 16,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 20),
            Container(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: _updateUsername,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFF007AFF),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 24.0),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 2.2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
