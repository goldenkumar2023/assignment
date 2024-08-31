import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class demo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a new user to Firestore with a specified ID
  Future<void> addUser(UserModel user) async {
    try {
      // Use the user ID as the document ID in Firestore
      await _firestore.collection('users').doc(user.id).set(user.toMap());
    } catch (e) {
      throw Exception('Failed to add user: $e');
    }
  }
}
