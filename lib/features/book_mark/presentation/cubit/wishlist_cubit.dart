import 'package:bloc/bloc.dart';
import 'package:bookia/features/book_mark/data/models/wishlist_model.dart';
import 'package:bookia/features/book_mark/data/repo/wishlist_repo.dart';
import 'package:bookia/features/home/data/models/best_seller_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  showWishList()async{
    emit(WishlistLoading());
    final repo=await WishListRepo.showFavorite();
    if(repo is WishlistModel){
      emit(WishlistSuccess(repo.data?.data ?? []));
    }else{
      emit(WishlistError());
    }
  }
  removeFavorite(int productId)async{
    emit(FavoriteLoading());
    final repo=await WishListRepo.removeFavorite(productId);
    if(repo!=null){
      emit(FavoriteSuccess());
    }else{
      emit(FavoriteError());
    }
  }


}
