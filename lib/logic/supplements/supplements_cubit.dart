import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'supplements_state.dart';

class SupplementsCubit extends Cubit<SupplementsState> {
  SupplementsCubit() : super(SupplementsInitial());

  static SupplementsCubit get(context) => BlocProvider.of(context);
  List<dynamic> supplementsData = [];

  Map<String, dynamic> ?supplementsDataSingle = {};
  void addSupplementsCubit({required String userId,
    required List data}) {
    emit(LoadingAddSupplementsState());
    supplementsData.addAll(data);

    FirebaseFirestore.instance
        .collection("Users")
        .doc(userId) /*User id*/
        .collection("Supplements")
        .doc(userId) /* Which Day*/
        .set({"data": supplementsData})
        .then((value) {
      emit(SuccessfullyAddSupplementsState());
    }).catchError((error) {
      emit(ErrorAddSupplementsState(error));
    });
  }

  Future getSupplementsCubit({
    required String userId,
  }) {
    supplementsData = [];
    emit(LoadingGetSupplementsState());
    return FirebaseFirestore.instance
        .collection("Users")
        .doc(userId)
        .collection("Supplements")
        .doc(userId)
        .get()
        .then((value) {
      supplementsDataSingle = value.data()!;
      supplementsData.addAll({supplementsDataSingle!["data"]});
      emit(SuccessfullyGetSupplementsState());
    }).catchError((error) {
      supplementsData = [];
      emit(ErrorGetSupplementsState(error.toString()));
    });
  }
}
