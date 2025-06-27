// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> googleSignInAndCheckEmail(BuildContext context) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
  final GoogleSignIn googleSignIn = GoogleSignIn();

  try {
    // Trigger the Google Authentication flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      // The user canceled the sign-in
      return;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in to Firebase with the Google credentials
    UserCredential userCredential =
        await _auth.signInWithCredential(credential);

    // Get the user's email
    String? email = userCredential.user?.email;

    if (email != null) {
      // Check if the email is in the whitelistedEmails node
      DatabaseEvent event = await _dbRef.child('whitelistedEmails').once();
      final List<dynamic> whitelistedEmails =
          event.snapshot.value as List<dynamic>? ?? [];

      if (whitelistedEmails.contains(email)) {
        // Navigate to HomePage if the email is whitelisted
        Navigator.pushNamed(context, 'HomePage');
      } else {
        // Show an error message if the email is not whitelisted
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Email is not whitelisted.')),
        );
      }
    }
  } catch (e) {
    // Handle errors
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $e')),
    );
  }
}
