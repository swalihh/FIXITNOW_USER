class UserModel {
  final int id;
  final String username;
  final String email;
  final String phone;
  final String location;
  final String password;
  final int otp;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.location,
    required this.password,
    required this.otp,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      location: json['location'] as String,
      password: json['password'] as String,
      otp: json['otp'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'phone': phone,
      'location': location,
      'password': password,
      'otp': otp,
    };
  }
}
