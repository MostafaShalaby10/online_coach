class ExerciseModel{
  String? link ;
  String? label ;
  String? times ;

  ExerciseModel({required this.label , required this.link , required this.times});


  ExerciseModel.fromJson(Map<dynamic, dynamic> json) {
    link = json['link'];
    label = json['label'];
    times = json['times'];
  }


}