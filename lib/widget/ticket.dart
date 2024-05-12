import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:traveling_app/models/ticket_model.dart';

class TicketPreview extends StatefulWidget {
  final String imagePath;
  final String time;
  final String duration;
  final String airline;
  final String price;
  final VoidCallback? onBookPressed;

  const TicketPreview({
    Key? key,
    required this.imagePath,
    required this.time,
    required this.duration,
    required this.airline,
    required this.price,
    this.onBookPressed,
  }) : super(key: key);

  @override
  State<TicketPreview> createState() => _TicketPreviewState();
}

class _TicketPreviewState extends State<TicketPreview> {
  late String _username;

  @override
  void initState() {
    super.initState();
    // Fetch the username asynchronously when the widget initializes
    _fetchUsername();
  }

  Future<void> _fetchUsername() async {
    try {
      final username = await _fetchUsernameFromFirestore();
      setState(() {
        _username = username;
      });
    } catch (e) {
      print('Error fetching username: $e');
      // Handle error
    }
  }

  Future<String> _fetchUsernameFromFirestore() async {
    try {
      if (FirebaseAuth.instance.currentUser != null) {
        final userId = FirebaseAuth.instance.currentUser!.uid;
        final userDocRef =
            FirebaseFirestore.instance.collection('users').doc(userId);
        final userSnapshot = await userDocRef.get();
        return userSnapshot['username'];
      } else {
        throw Exception('User not authenticated');
      }
    } catch (e) {
      print('Error fetching username from Firestore: $e');
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            widget.imagePath,
            width: 60.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.time,
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  widget.duration,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  widget.airline,
                  style: TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 37, 37, 37),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.price,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 13.0,
                ),
              ),
              TextButton(
                onPressed: () async {
                  final userId = FirebaseAuth.instance.currentUser?.uid;

                  if (userId != null) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text("Booking Confirmation"),
                          content: Text(
                              "Are you sure you want to book this flight?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                // Close the dialog
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0)),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                // Get username if not fetched yet
                                if (_username.isEmpty) {
                                  await _fetchUsername();
                                }

                                // Add booking to Firestore using FirebaseService
                                FirebaseService().addBookingToFirestore(
                                  userId,
                                  widget.time,
                                  widget.duration,
                                  widget.airline,
                                  widget.price,
                                );

                                // Close the dialog
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.blue,
                                ),
                                child: Text(
                                  'Confirm',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    print("User not authenticated.");
                    // Handle user authentication issue
                  }
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blue,
                  ),
                  child: Text(
                    'Book',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
