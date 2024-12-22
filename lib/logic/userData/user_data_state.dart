part of 'user_data_cubit.dart';

class UserDataState {}

final class UserDataInitial extends UserDataState {}

final class LoadingGetUserDataState extends UserDataState {}
final class SuccessfullyGetUserDataState extends UserDataState {}
final class ErrorGetUserDataState extends UserDataState {
  final String error ;
  ErrorGetUserDataState(this.error);
}

final class LoadingGetSpecificUserDataState extends UserDataState {}
final class SuccessfullyGetSpecificUserDataState extends UserDataState {}
final class ErrorGetSpecificUserDataState extends UserDataState {
  final String error ;
  ErrorGetSpecificUserDataState(this.error);
}
final class LoadingDeleteCurrentAccountState extends UserDataState {}
final class SuccessfullyDeleteCurrentAccountState extends UserDataState {}
final class ErrorDeleteCurrentAccountState extends UserDataState {
  final String error ;
  ErrorDeleteCurrentAccountState(this.error);
}

final class LoadingUpdatePasswordState extends UserDataState {}
final class SuccessfullyUpdatePasswordState extends UserDataState {}
final class ErrorUpdatePasswordState extends UserDataState {
  final String error ;
  ErrorUpdatePasswordState(this.error);
}


final class LoadingUpdateDataState extends UserDataState {}
final class SuccessfullyUpdateDataState extends UserDataState {}
final class ErrorUpdateDataState extends UserDataState {
  final String error ;
  ErrorUpdateDataState(this.error);
}