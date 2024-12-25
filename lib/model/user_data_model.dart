class UserDataModel {
  String? email;
  String? name;
  String? phone;
  String? id;
  String? role;

  UserDataModel({this.email, this.phone, this.name, this.id , this.role});

  UserDataModel.fromJson(Map<dynamic, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    id = json['id'];
    role = json['role'];
  }

  Map<String, dynamic> toMap() {
    return {"name": name, "phone": phone, "email": email, "id": id , "role":role};
  }
}
