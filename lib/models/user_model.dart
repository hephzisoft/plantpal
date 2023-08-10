import 'package:flutter/foundation.dart';

class User extends ChangeNotifier {
  final String uid;
  final String? fullName;
  final String? address;
  final String email;
  final String? age;
  final String? gender;

  User({
    required this.uid,
    this.fullName,
    this.address,
    required this.email,
    this.age,
    this.gender,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'address': address,
      'email': email,
      'age': age,
      'gender': gender,
    };
  }
}
