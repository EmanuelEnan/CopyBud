class UserModel {
  String? id;
  String fullName;
  String email;

  // String phoneNo;

  // String password;

  UserModel({
    this.id,
    required this.fullName,
    required this.email,
    // required this.phoneNo,
    // required this.password
  });

  tosJson() {
    return {
      "fullName": fullName,
      "email": email,
      // "phoneNo": phoneNo,
      // "password": password
    };
  }
}
