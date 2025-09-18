import 'package:bookia/core/constants/api_constants.dart';
import 'package:bookia/core/services/network/network_service.dart';
import 'package:bookia/features/book_mark/data/models/wishlist_model.dart';
import 'package:bookia/features/home/data/models/best_seller_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/services/local/shared_prefs_helper.dart';

class WishListRepo{
  static addFavorite(int productId)async{
    NetworkService.dio.options.headers={
      "authorization":"Bearer ${SharedPrefsHelper.getString('token')}"

    };

  try{
    Response response=await NetworkService.dio.post(ApiConstants.addToWishlist,data: {
      "product_id" : productId
    });
    if(response.statusCode==200){

    }else{
      return null;
    }
  }catch(e){
    return null;
  }
  } static removeFavorite(int productId)async{
    NetworkService.dio.options.headers={
      "authorization":"Bearer ${SharedPrefsHelper.getString('token')}"
    };
  try{
    Response response=await NetworkService.dio.post(ApiConstants.removeFromCart,data: {
      "product_id" : productId
    });
    if(response.statusCode==200){

    }else{
      return null;
    }
  }catch(e){
    return null;
  }
  }

 static showFavorite()async{
    try{
      Response response=await NetworkService.dio.get(ApiConstants.wishlist);
      if(response.statusCode==200){
        return WishlistModel.fromJson(response.data);
      }
      else{
        return null;
      }
    }catch(e){
      return null;
    }
  }
}