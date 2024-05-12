import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addBookingToFirestore(
    String userId,
    String time,
    String duration,
    String airline,
    String price,
  ) async {
    try {
      // Generate a unique document ID for the booking
      String bookingId = _firestore.collection('user_flights_$userId').doc().id;

      // Create a specific document with the generated ID in the user's flight collection
      await _firestore.collection('user_flights_$userId').doc('booking').set({
        'time': time,
        'duration': duration,
        'airline': airline,
        'price': price,
        'timestamp': FieldValue.serverTimestamp(),
      });

      print('Booking added successfully with ID: $userId');
    } catch (error) {
      print('Failed to add booking: $error');
      throw error;
    }
  }

  Future<void> removeBookingFromFirestore(String userId) async {
    try {
      // Delete the booking document from the user's flight collection
      await _firestore
          .collection('user_flights_$userId')
          .doc('booking')
          .delete();
      print('Booking removed successfully for user: $userId');
    } catch (error) {
      print('Failed to remove booking: $error');
      throw error;
    }
  }
}
