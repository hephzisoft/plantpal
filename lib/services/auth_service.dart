import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../models/user_model.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  User? _userFromFirebase(
    auth.User? user,
  ) {
    if (user == null) {
      return null;
    }
    return User(uid: user.uid, email: user.email!);
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

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
  }

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

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set(user.toMap());

      return _userFromFirebase(credential.user);
    } catch (error) {
      log(error.toString());
    }
    return null;
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
