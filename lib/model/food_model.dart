class FoodModel{
Map? breakFast;
Map? lunch;
Map? dinner;

FoodModel({this.breakFast , this.dinner , this.lunch}) ;
FoodModel.fromJson(Map<dynamic, dynamic> json) {
  breakFast = json['breakFast'];
  lunch = json['lunch'];
  dinner = json['dinner'];
}

}