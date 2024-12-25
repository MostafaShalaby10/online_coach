import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_coach/model/user_data_model.dart';
import 'package:online_coach/shared/shared_preferences/shared_preferences.dart';

part 'authentication_state.dart';

class AUTHCubit extends Cubit<AUTHState> {
  AUTHCubit() : super(LoginInitial());

  static AUTHCubit get(context) => BlocProvider.of(context);

  //    authentication function
  void loginCubitFunction(
      {required String email, required String password}) async {
    emit(LoadingLoginState());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      SharedPrefs.saveData(key: "UID", value: value.user!.uid);
      emit(SuccessfullyLoginState());
    }).catchError((error) {
      emit(ErrorLoginState(error.toString()));
    });
  }

  UserDataModel? userDataModel;

  void createAnAccountCubitFunction(
      {required String email,
      required String password,
      required String phone,
      required String role,
      required String name}) {
    emit(LoadingCreateAccountState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      userDataModel = UserDataModel(role: role,
          phone: phone, email: email, name: name, id: value.user!.uid);
      FirebaseFirestore.instance
          .collection("Users")
          .doc(value.user!.uid)
          .set(userDataModel!.toMap());
      emit(SuccessfullyCreateAccountState());
    }).catchError((error) {
      emit(ErrorCreateAccountState(error.toString()));
    });
  }

  void resetPasswordCubit({required String email}) {
    emit(LoadingResetPasswordState());
    FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) {
      emit(SuccessfullyResetPasswordState());
    }).catchError((error) {
      emit(ErrorResetPasswordState(error.toString()));
    });
  }


// End of class
}
