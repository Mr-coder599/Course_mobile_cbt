class Register {
  late final String uid;
  late final String fullName;
  late final String gender;
  late final String email;
  late final String password;
  // late final String email;

  Register({
    required this.uid,
    required this.fullName,
    required this.gender,
    required this.email,
    required this.password,
  });

  factory Register.froJson(Map<String, dynamic> json) {
    return Register(
      uid: json['uid'],
      fullName: json['fullName'],
      gender: json['gender'],
      email: json['email'],
      password: json['password'],
      // email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'fullName': fullName,
      'gender': gender,
      'email': email,
      'password': password,
      // 'email': email,
    };
  }
}
