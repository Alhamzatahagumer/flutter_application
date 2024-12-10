class Login {
  bool? status;
  String? message;
  UserData? data;

  //Login({this.status, this.message, this.data});

  Login.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? password;
  String? image;
  int? point;
  int? credit;
  String? token;

  //UserData({
   // this.id,
   // this.name,
   // this.email,
   // this.password,
   // this.image,
   // this.point,
   // this.credit,
   // this.token,
  //});

  // Factory constructor for parsing JSON
  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    image = json['image'];
    point = json['point'];
    credit = json['credit'];
    token = json['token'];
  }
}
