import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_coach/model/user_personal_data_model.dart';

part 'personal_data_state.dart';

class PersonalDataCubit extends Cubit<PersonalDataState> {
  PersonalDataCubit() : super(PersonalDataInitial());

  static PersonalDataCubit get(context) => BlocProvider.of(context);

  void addPersonalDataCubit(
      {required String userId, required Map<String, dynamic> data}) {
    emit(LoadingAddPersonalDataState());
    FirebaseFirestore.instance
        .collection("Users")
        .doc(userId) /*User id*/
        .collection("PersonalData")
        .doc(userId) /*ID for user */
        .set(data)
        .then((value) {
      emit(SuccessfullyAddPersonalDataState());
    }).catchError((error) {
      emit(ErrorAddPersonalDataState(error));
    });
  }

   Map<String, dynamic>? userPersonalData;

  UserPersonalDataModel? userPersonalDataModel;

  Future getPersonalDataCubit({
    required String userId,
  }) async{
  try  {
      userPersonalData = {};
      emit(LoadingGetPersonalDataState());
      return await FirebaseFirestore.instance
          .collection("Users")
          .doc(userId)
          .collection("PersonalData")
          .doc(userId)
          .get()
          .then((value) {
        userPersonalData = value.data()!;
        emit(SuccessfullyGetPersonalDataState());
      }).catchError((error) {
        emit(ErrorGetPersonalDataState(error));
      });
    }catch(e){
          userPersonalData={};
          emit(ErrorGetPersonalDataState(e.toString()));

    }
  }
}
