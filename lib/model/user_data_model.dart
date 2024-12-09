class UserDataModel {
  String? email;
  String? name;
  String? phone;
  String? id;

  UserDataModel({this.email, this.phone, this.name, this.id});

  UserDataModel.fromJson(Map<dynamic, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    id = json['id'];
  }

  Map<String, dynamic> toMap() {
    return {"name": name, "phone": phone, "email": email, "id": id};
  }
}
