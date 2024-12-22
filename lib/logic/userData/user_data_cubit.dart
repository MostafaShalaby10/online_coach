import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_coach/model/user_data_model.dart';

import '../../shared/shared_preferences/shared_preferences.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataInitial());

  static UserDataCubit get(context) => BlocProvider.of(context);
  late List<dynamic> usersData;

  UserDataModel? userDataModel;

  Future getAllUserData() async {
    usersData = [];
    emit(LoadingGetUserDataState());
    return await FirebaseFirestore.instance
        .collection("Users")
        .get()
        .then((value) {
      for (var element in value.docs) {
        if (SharedPrefs.getData(key: "UID") != element.data()["id"])
        usersData.add(UserDataModel.fromJson(element.data()));
      }
      emit(SuccessfullyGetUserDataState());
    }).catchError((error) {
      emit(ErrorGetUserDataState(error.toString()));
    });
  }

  Map<String, dynamic> specificUserData = {};

  Future getSpecificUserData({required String id}) async {
    specificUserData = {};
    emit(LoadingGetSpecificUserDataState());
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(id)
        .get()
        .then((value) {
      specificUserData = value.data()!;
      emit(SuccessfullyGetSpecificUserDataState());
    }).catchError((error) {
      emit(ErrorGetSpecificUserDataState(error.toString()));
    });
  }

  void deleteCurrentUser({required id}) async {
    emit(LoadingDeleteCurrentAccountState());
    await FirebaseAuth.instance.currentUser!.delete().then((value) async {
      await FirebaseFirestore.instance.collection("Users").doc(id).delete();
      await FirebaseFirestore.instance.runTransaction((transaction) async =>
          transaction
              .delete(FirebaseFirestore.instance.collection("Users").doc(id)));
      emit(SuccessfullyDeleteCurrentAccountState());
    }).catchError((error) {
      emit(ErrorDeleteCurrentAccountState(error));
    });
  }

  void updatePassword({required String password}) {
    emit(LoadingUpdatePasswordState());
    FirebaseAuth.instance.currentUser!.updatePassword(password).then((value) {
      emit(SuccessfullyUpdatePasswordState());
    }).catchError((error) {
      emit(ErrorUpdatePasswordState(error));
    });
  }

  Future updateUserData(
      {required String id, required Map<String, dynamic> data}) {
    emit(LoadingUpdateDataState());
    return FirebaseFirestore.instance
        .collection("Users")
        .doc(id)
        .update(data)
        .then((value) {
          emit(SuccessfullyUpdateDataState());
    })
        .catchError((error) {
          emit(ErrorUpdateDataState(error.toString()));
    });
  }
}
