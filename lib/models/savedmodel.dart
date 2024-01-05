class SavedModel {
  int wishlistId;
  dynamic servicerId;
  String username;
  String phone;
  String fullname;
  String description;
  String serviceCategory; 
  int amount;
  String location;
  String servicerImage;

  SavedModel({
    required this.wishlistId,
    required this.servicerId,
    required this.username,
    required this.phone,
    required this.fullname,
    required this.description,
    required this.serviceCategory,
    required this.amount,
    required this.location,
    required this.servicerImage,
  });

  factory SavedModel.fromJson(Map<String, dynamic> json) {
    return SavedModel(
      wishlistId: json['wistlist_id'],
      servicerId: json['servicer_id'],
      username: json['username'],
      phone: json['phone'],
      fullname: json['fullname'],
      description: json['description'],
      serviceCategory: json['servicecatagory'],
      amount: json['amount'],
      location: json['location'],
      servicerImage: json['servicerimage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'wishlist_id': wishlistId,
      'servicer_id': servicerId,
      'username': username,
      'phone': phone,
      'fullname': fullname,
      'description': description,
      'servicecatagory': serviceCategory,
      'amount': amount,
      'location': location,
      'servicerimage': servicerImage,
    };
  }
}
