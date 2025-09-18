import 'package:bloc/bloc.dart';
import 'package:bookia/features/book_mark/data/repo/wishlist_repo.dart';
import 'package:bookia/features/home/data/models/banner_model.dart';
import 'package:bookia/features/home/data/models/best_seller_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../data/repo/home.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  bestSeller() async {
    emit(HomeLoading());
    try {
      final repo = await Home.bestSeller();
      if (repo == null) {
        emit(HomeError("Something went wrong!"));
      } else {
        if (repo is BestSeller) {
          emit(HomeSuccess(repo.data?.products ?? []));
        }
      }
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  imageSlider() async {
    emit(SliderLoading());
    try {
      final response = await Home.sliderImage();
      if (response == null) {
        emit(SliderError());
      } else {
        if (response is BannerModel) {
          emit(SliderSuccess(response.data?.sliders ?? []));
        }
      }
    } catch (e) {
      emit(SliderError());
    }
  }

  addToCard(int idProduct) async {
    emit(AddToCartLoadingState());

    final response = await Home.addToCard(idProduct);
    if (response != null) {
      emit(AddToCartSuccessState(response));
    } else {
      emit(AddToCartErrorState());
    }
  }
  booksSearch(String name) async {
    emit(SearchLoadingState());
    final response = await Home.booksSearch(name);
    if (response != null) {
      if(response is BestSeller){
        emit(SearchSuccessState(response.data?.products??[]));
      }
    } else {
      emit(SearchErrorState("non found, please try again!"));
    }

  }
  Map<int, bool> favorites = {}; // productId -> isFavorite


  void addFavoriteClick(int productId) {
    favorites[productId] = true;
    emit(CheckFavorite(productId: productId, isFavorite: true));
  }void removeFavoriteClick(int productId) {
    favorites[productId] = false;
    emit(CheckFavorite(productId: productId, isFavorite: false));
  }
  bool isProductFavorite(int productId) {
    return favorites[productId]??false;
  }
  addFavorite(int productId)async{
    emit(FavoriteLoading());
    final repo=await WishListRepo.addFavorite(productId);
    if(repo!=null){
      emit(FavoriteSuccess());
    }else{
      emit(FavoriteError());
    }
  }
}
