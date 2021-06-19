
class TourUser {
  String status;
  String token;
  Data data;

  TourUser({this.status, this.token, this.data});

  TourUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  User user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  String photo;
  String role;
  String sId;
  String name;
  String email;
  int iV;
  String passwordChangedAt;

  User(
      {this.photo,
        this.role,
        this.sId,
        this.name,
        this.email,
        this.iV,
        this.passwordChangedAt});

  User.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
    role = json['role'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    iV = json['__v'];
    passwordChangedAt = json['passwordChangedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo'] = this.photo;
    data['role'] = this.role;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['__v'] = this.iV;
    data['passwordChangedAt'] = this.passwordChangedAt;
    return data;
  }
}