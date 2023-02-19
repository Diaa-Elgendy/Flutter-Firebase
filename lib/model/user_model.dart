class UserModel {
  String? email;
  String? name;
  String? phone;
  String? uId;
  bool? isEmailVerified;

  UserModel({required this.email, required this.name, required this.phone, required this.uId});

  UserModel.fromJson(Map<String, dynamic> json){
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'uId': uId,
      'isEmailVerified': isEmailVerified,
    };
  }
}