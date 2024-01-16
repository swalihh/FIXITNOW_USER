class ServicersModel {
  final dynamic id;
  final dynamic username;
  final dynamic email;
  final String phone;
  final dynamic password;
  final dynamic otp;
  final String fullname;
  final String description;
  final String serviceCategory;
  final dynamic verificationDocument;
  final double amount;
  final String location;
  final String servicerImage;
  final dynamic servicerDocument;
  final dynamic status;
  final dynamic date; // Added field
  final dynamic time; // Added field
  final dynamic serviceAmount; // Added field

  ServicersModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.otp,
    required this.fullname,
    required this.description,
    required this.serviceCategory,
    required this.verificationDocument,
    required this.amount,
    required this.location,
    required this.servicerImage,
    required this.servicerDocument,
    required this.status,
    required this.date,
    required this.time,
    required this.serviceAmount,
  });

factory ServicersModel.fromJson(Map<String, dynamic> json) {
  return ServicersModel(
    id: json['id'],
    username: json['username'],
    email: json['email'],
    phone: json['phone'],
    password: json['password'],
    otp: json['otp'],
    fullname: json['fullname'],
    description: json['description'],
    serviceCategory: json['servicecatagory'],
    verificationDocument: json['verificationdocument'],
    amount: json['amount']?.toDouble() ?? 0.0, // Handle null by providing a default value
    location: json['location'],
    servicerImage: json['servicerimage'],
    servicerDocument: json['servicerdocument'],
    status: json['status'],
    date: json['date'],
    time: json['time'],
    serviceAmount: json['serviceamount']?.toDouble() ?? 0.0, // Handle null by providing a default value
  );
}


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
      'otp': otp,
      'fullname': fullname,
      'description': description,
      'servicecatagory': serviceCategory,
      'verificationdocument': verificationDocument,
      'amount': amount,
      'location': location,
      'servicerimage': servicerImage,
      'servicerdocument': servicerDocument,
      'status': status,
      'date': date,
      'time': time,
      'serviceamount': serviceAmount,
    };
  }
}
