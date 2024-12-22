part of 'food_cubit.dart';


sealed class FoodState {}

final class FoodInitial extends FoodState {}

final class LoadingAddFoodState extends FoodState {}
final class SuccessfullyAddFoodState extends FoodState {}
final class ErrorAddFoodState extends FoodState {
  final String error ;
  ErrorAddFoodState(this.error);
}

final class LoadingGetFoodState extends FoodState {}
final class SuccessfullyGetFoodState extends FoodState {}
final class ErrorGetFoodState extends FoodState {
  final String error ;
  ErrorGetFoodState(this.error);
}
