class User {
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
}
