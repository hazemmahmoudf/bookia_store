part of 'wishlist_cubit.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}

final class WishlistSuccess extends WishlistState {
 final List<WishlistItem> items;
 WishlistSuccess(this.items);
}
final class WishlistError extends WishlistState {}
final class WishlistLoading extends WishlistState {}

final class FavoriteSuccess extends WishlistState {}
final class FavoriteError extends WishlistState {}
final class FavoriteLoading extends WishlistState {}



