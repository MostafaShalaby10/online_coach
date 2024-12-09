part of 'user_data_cubit.dart';

class UserDataState {}

final class UserDataInitial extends UserDataState {}

final class LoadingGetUserDataState extends UserDataState {}
final class SuccessfullyGetUserDataState extends UserDataState {}
final class ErrorGetUserDataState extends UserDataState {
  final String error ;
  ErrorGetUserDataState(this.error);
}
