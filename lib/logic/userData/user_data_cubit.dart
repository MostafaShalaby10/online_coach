import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_coach/model/user_data_model.dart';
import 'package:online_coach/shared/shared_preferences/shared_preferences.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataInitial());

  static UserDataCubit get(context) => BlocProvider.of(context);

  // Future saveUserData({required Map<String , dynamic> data}) {
  //   emit(LoadingSaveUserDataState());
  //   return FirebaseFirestore.instance.collection("Users").doc().set(data).then((value) {
  //     emit(SuccessfullySaveUserDataState());
  //   }).catchError((error) {
  //     emit(ErrorSaveUserDataState(error.toString()));
  //   });
  // }
  late List<dynamic> usersData ;

  UserDataModel? userDataModel;

  Future getAllUserData() async {
    usersData = [];
    emit(LoadingGetUserDataState());
    return await FirebaseFirestore.instance
        .collection("Users")
        .get()
        .then((value) {
      for (var element in value.docs) {
        usersData.add(UserDataModel.fromJson(element.data()));
      }
      // print(usersData.length);
      print("success");
      emit(SuccessfullyGetUserDataState());
    }).catchError((error) {
      emit(ErrorGetUserDataState(error.toString()));
    });
  }
}
