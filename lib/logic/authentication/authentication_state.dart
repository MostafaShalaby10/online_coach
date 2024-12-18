part of 'authentication_cubit.dart';


 class AUTHState {}

final class LoginInitial extends AUTHState {}


final class LoadingLoginState extends AUTHState {}
final class SuccessfullyLoginState extends AUTHState {}
final class ErrorLoginState extends AUTHState {
  final String error ;
  ErrorLoginState(this.error);
}

final class LoadingCreateAccountState extends AUTHState {}
final class SuccessfullyCreateAccountState extends AUTHState {}
final class ErrorCreateAccountState extends AUTHState {
  final String error ;
  ErrorCreateAccountState(this.error);
}

final class LoadingResetPasswordState extends AUTHState {}
final class SuccessfullyResetPasswordState extends AUTHState {}
final class ErrorResetPasswordState extends AUTHState {
  final String error ;
  ErrorResetPasswordState(this.error);
}

