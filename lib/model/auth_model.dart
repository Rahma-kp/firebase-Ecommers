class AuthenticationModel {
  String? uId;
  String? name;
  String? email;
  String? phoneNumber;

  AuthenticationModel({
    required this.email,
    required this.name,
    this.phoneNumber,
    required this.uId,
  });

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationModel(
      email: json['email'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      uId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'userId': uId,
    };
  }
}
