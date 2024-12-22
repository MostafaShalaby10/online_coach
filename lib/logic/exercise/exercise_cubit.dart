import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'exercise_state.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  ExerciseCubit() : super(ExerciseInitial());

  static ExerciseCubit get(context) => BlocProvider.of(context);

  void addExerciseCubit(
      {required String userId, required String day, required List data}) {
    emit(LoadingAddExerciseState());

    exerciseData.addAll(data);

    FirebaseFirestore.instance
        .collection("Users")
        .doc(userId) /*User id*/
        .collection("Exercise")
        .doc("Day $day") /* Which Day*/
        .set({"data": exerciseData}).then((value) {
      emit(SuccessfullyAddExerciseState());
    }).catchError((error) {
      emit(ErrorAddExerciseState(error));
    });
  }

  List<dynamic> exerciseData = [];

  Map<String, dynamic> exerciseDataSingle = {};

  Future? getExerciseCubit({
    required String userId,
    required String day,
  }) {
    emit(LoadingGetExerciseState());

    return FirebaseFirestore.instance
        .collection("Users")
        .doc(userId)
        .collection("Exercise")
        .doc("Day $day")
        .get()
        .then((value) {
      exerciseDataSingle = value.data()!;
      exerciseData.addAll({exerciseDataSingle["data"]});
      emit(SuccessfullyGetExerciseState());
    }).catchError((error) {
      exerciseData = [];

      emit(ErrorGetExerciseState(error.toString()));
    });
  }
}
