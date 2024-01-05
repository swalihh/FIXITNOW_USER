
class BookingModel {
  String date;
  String time;
  String description;
  String fullname;
  String username;
  String phone;
  String serviceCategory;
  int serviceAmount;
  String status;
  String servicerImage;
  String location;

  BookingModel({
    required this.date,
    required this.time,
    required this.description,
    required this.fullname,
    required this.username,
    required this.phone,
    required this.serviceCategory,
    required this.serviceAmount,
    required this.status,
    required this.servicerImage,
    required this.location,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      date: json['date'],
      time: json['time'],
      description: json['description'],
      fullname: json['fullname'],
      username: json['username'],
      phone: json['phone'],
      serviceCategory: json['servicecatagory'],
      serviceAmount: json['serviceamount'],
      status: json['status'],
      servicerImage: json['servicerimage'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'time': time,
      'description': description,
      'fullname': fullname,
      'username': username,
      'phone': phone,
      'servicecatagory': serviceCategory,
      'serviceamount': serviceAmount,
      'status': status,
      'servicerimage': servicerImage,
      'location': location,
    };
  }
}
