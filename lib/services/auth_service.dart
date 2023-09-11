import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
// import 'package:flutter/material.dart';

import '../models/user_model.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance; // This is an instance of Firebase Authentication that will be used throughout the class to interact with user authentication features.

  User? _userFromFirebase(
      auth.User? user,
      ) {
    if (user == null) {
      return null;
    }
    return User(
        uid: user.uid,
        email: user
            .email!); // this is used to convert the user gotten from firebase auth to the user of the current application.
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  } // This is used to get the current user state like when the user is loggedin or loggedOut.

  Future<User?> signInWithEmailAndPassword(
      String email,
      String password,
      ) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return _userFromFirebase(credential.user);
    } catch (error) {
      log(error.toString());
    }
    return null;
  } // This is used to for logging in the user

  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
    required String age,
    required String address,
    required String gender,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = User(
        uid: credential.user!.uid,
        fullName: fullName,
        address: address,
        email: credential.user!.email as String,
        age: age,
        gender: gender,
      );

      await FirebaseFirestore.instance.collection('users').doc(user.uid).set(user
          .toMap()); // This is used to store user data to firebase cloud i.e cloud firestore.

      return _userFromFirebase(credential.user);
    } on auth.FirebaseAuthException catch (error) {
      log(error.toString());
    }
    return null;
  } //  This is used to sign up the user .

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  } //  this is used for signing out the user.

  Future<void> sendEmailVerification(auth.User user) async {
    try {
      await user.sendEmailVerification();
      log('Email verification sent');
    } catch (error) {
      log(error.toString());
    }
  } // This is used for sending email verfication.
}
