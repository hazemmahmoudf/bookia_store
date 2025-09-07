part of 'basket_cubit.dart';

@immutable
sealed class BasketState {}

final class BasketInitial extends BasketState {}

final class BasketSuccess extends BasketState {
 final List<CartItems> cart;
 final double ?total;
  BasketSuccess(this.cart, this.total);
}
final class BasketError extends BasketState {}
final class BasketLoading extends BasketState {}

final class BasketRemoveLoading extends BasketState {}
final class BasketRemoveSuccess extends BasketState {
  final String message;
  BasketRemoveSuccess( this.message);
}
final class BasketRemoveError extends BasketState {}

final class BasketUpdateError extends BasketState {}
final class BasketUpdateSuccess extends BasketState {}
final class BasketUpdateLoading extends BasketState {}

