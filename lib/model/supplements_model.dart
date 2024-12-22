class SupplementsModel {
  String? supplementsName;

  String? quantity;

  SupplementsModel({this.quantity, this.supplementsName});

  SupplementsModel.fromJson(Map<dynamic, dynamic> json) {
    quantity = json['quantity'];
    supplementsName = json['supplementsName'];
  }
}
