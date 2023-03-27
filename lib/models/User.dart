class User {
  String? userName;
  String? role;
  int? mobileNumber;
  String? password;
  String? email;

  User({
    this.userName,
    this.role,
    this.mobileNumber,
    this.password,
    this.email,
  });

  User.fromJson(dynamic json) {
    userName = json['user_name'];
    role = json['role'];
    mobileNumber = json['mobile_number'];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_name'] = userName;
    map['role'] = role;
    map['mobile_number'] = mobileNumber;
    map['password'] = password;
    map['email'] = email;
    return map;
  }
}
