class UserReg {
  // late final String uid;
  late final String names;
  late final String gender;
  late final String depart;
  late final String photo;
  late final String phone;
  UserReg({
    // required this.uid,
    required this.photo,
    required this.gender,
    required this.depart,
    required this.names,
    required this.phone,
  });

  factory UserReg.froJson(Map<String, dynamic> json) {
    return UserReg(
      // uid: json['uid'],
      photo: json['photo'],
      gender: json['gender'],
      depart: json['matricno'],
      names: json['names'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      //'uid': uid,
      'photo': photo,
      'gender': gender,
      'depart': depart,
      'names': names,
      'phone': phone,
    };
  }
}
