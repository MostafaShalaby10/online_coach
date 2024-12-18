import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  static FoodCubit get(context) => BlocProvider.of(context);

  void addFoodCubit({required String userId,
    required String day,
    required String mealType,
    required List data}) {
    emit(LoadingAddFoodState());
    // foodData[mealType].add(data)??foodData.addAll({mealType:data});
    foodData[mealType]==null?foodData.addAll({mealType:data}):foodData[mealType].add(data[0]);
    FirebaseFirestore.instance
        .collection("Users")
        .doc(userId) /*User id*/
        .collection("Food")
        .doc("Day $day") /* Which Day*/
        .set(foodData)
        .then((value) {
      emit(SuccessfullyAddFoodState());
    }).catchError((error) {
      emit(ErrorAddFoodState(error));
    });
  }
 Map<String , dynamic> foodData={} ;
  Future? getFoodCubit({
    required String userId,
    required String day,
  })  {
    emit(LoadingGetFoodState());

    return FirebaseFirestore.instance
        .collection("Users")
        .doc(userId)
        .collection("Food")
        .doc("Day $day")
        .get()
        .then((value) {
      foodData = value.data()!;
      // exerciseData.addAll({exerciseDataSingle["data"]});
      emit(SuccessfullyGetFoodState());
    }).catchError((error) {
      foodData = {};

      emit(ErrorGetFoodState(error.toString()));
    });
  }
}
