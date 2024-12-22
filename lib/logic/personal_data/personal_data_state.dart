part of 'personal_data_cubit.dart';

sealed class PersonalDataState {}

final class PersonalDataInitial extends PersonalDataState {}

final class LoadingAddPersonalDataState extends PersonalDataState {}
final class SuccessfullyAddPersonalDataState extends PersonalDataState {}
final class ErrorAddPersonalDataState extends PersonalDataState {
  final String error ;
  ErrorAddPersonalDataState(this.error);
}

final class LoadingGetPersonalDataState extends PersonalDataState {}
final class SuccessfullyGetPersonalDataState extends PersonalDataState {}
final class ErrorGetPersonalDataState extends PersonalDataState {
  final String error ;
  ErrorGetPersonalDataState(this.error);
}
