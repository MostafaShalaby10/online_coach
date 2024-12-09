class UserPersonalDataModel {
  String? weight;
  String? tall;
  String? age;
  String? gender;
  String? goal;
  String? days;
  String? weeks;
  String? period;
  String? id;

  UserPersonalDataModel(
      {this.weight,
      this.tall,
      this.age,
      this.days,
      this.gender,
      this.goal,
      this.period,
      this.id,
      this.weeks});

  UserPersonalDataModel.fromJson(Map<dynamic, dynamic> json) {
    weight = json['weight'];
    tall = json['tall'];
    age = json['age'];
    days = json['days'];
    gender = json['gender'];
    goal = json['goal'];
    period = json['period'];
    weeks = json['weeks'];
    id = json['id'];
  }

  Map<String, dynamic> toMap() {
    return {
      "age": age,
      "tall": tall,
      "weight": weight,
      "days": days,
      "gender": gender,
      "goal": goal,
      "period": period,
      "weeks": weeks,
      "id": id,
    };
  }
}
