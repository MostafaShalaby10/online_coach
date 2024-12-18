part of 'supplements_cubit.dart';

sealed class SupplementsState {}

final class SupplementsInitial extends SupplementsState {}

final class LoadingAddSupplementsState extends SupplementsState {}
final class SuccessfullyAddSupplementsState extends SupplementsState {}
final class ErrorAddSupplementsState extends SupplementsState {
  final String error ;
  ErrorAddSupplementsState(this.error);
}

final class LoadingGetSupplementsState extends SupplementsState {}
final class SuccessfullyGetSupplementsState extends SupplementsState {}
final class ErrorGetSupplementsState extends SupplementsState {
  final String error ;
  ErrorGetSupplementsState(this.error);
}
