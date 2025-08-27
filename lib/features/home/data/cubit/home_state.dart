part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeSuccess extends HomeState {
  List product=[];
  HomeSuccess(this.product);
}
final class HomeError extends HomeState {
  String messageError;
  HomeError(this.messageError);
}
final class HomeLoading extends HomeState {}
