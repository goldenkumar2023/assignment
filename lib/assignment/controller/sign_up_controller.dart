import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/assignment/controller/user_datascreen.dart';
import 'package:uuid/uuid.dart';

import '../models/user_model.dart';
import '../view/screens/home_screen.dart';

class SignUpController {
  final demo _demo = demo();
  final Uuid _uuid = Uuid();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUp(
      BuildContext context, String name, String email, String password) async {
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Name, email, and password cannot be empty')),
      );
      return;
    }

    try {
      // Check if a user with this email already exists
      List<String> signInMethods =
          await _auth.fetchSignInMethodsForEmail(email);

      if (signInMethods.isNotEmpty) {
        // If the list is not empty, the email is already registered
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Email is already in use. Please log in instead.')),
        );
        return;
      }

      // Create user with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Generate a unique ID for the user
      String userId = _uuid.v4();

      // Create user model and add to Firestore
      UserModel user = UserModel(id: userId, name: name, email: email);
      await _demo.addUser(user);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign up successful')),
      );

      // Navigate to the Home screen after successful sign-up
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign up failed: ${e.toString()}')),
      );
    }
  }
}
