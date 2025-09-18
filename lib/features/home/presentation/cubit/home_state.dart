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
final class SearchErrorState extends HomeState {
  final String message;
  SearchErrorState(this.message);
}
final class SearchLoadingState extends HomeState {}
final class SearchSuccessState extends HomeState {
  final List<Products> book;
  SearchSuccessState(this.book);
}
final class CheckFavorite extends HomeState{
    final bool isFavorite;
    final int productId;
    CheckFavorite({required this.isFavorite,required this.productId});
}


final class FavoriteSuccess extends HomeState {}
final class FavoriteLoading extends HomeState {}
final class FavoriteError extends HomeState {

}