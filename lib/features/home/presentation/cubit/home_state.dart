part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<Products> product;
  HomeSuccess(this.product);
}

final class HomeError extends HomeState {
  final String messageError;
  HomeError(this.messageError);
}

final class HomeLoading extends HomeState {}

final class SliderError extends HomeState {}

final class SliderSuccess extends HomeState {
  final List<Sliders> images;
  SliderSuccess(this.images);
}

final class SliderLoading extends HomeState {}

final class AddToCartLoadingState extends HomeState {}

final class AddToCartSuccessState extends HomeState {
  final String message;
  AddToCartSuccessState(this.message);
}

final class AddToCartErrorState extends HomeState {}
