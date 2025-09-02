import 'package:bookia/core/constants/api_constants.dart';
import 'package:bookia/core/services/network/network_service.dart';
import 'package:bookia/features/basket/data/models/show_card_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/services/local/shared_prefs_helper.dart';

class ShowCardRepo {
  static showCard() async {
    NetworkService.dio.options.headers = {
      "authorization": "Bearer ${SharedPrefsHelper.getString('token')}",
    };
    try {
      Response response = await NetworkService.dio.get(ApiConstants.showCart);
      if (response.statusCode == 200) {
        return ShowCard.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
 static removeCart(int itemId)async{
    NetworkService.dio.options.headers = {
      "authorization": "Bearer ${SharedPrefsHelper.getString('token')}",
    };
    try {
      Response response = await NetworkService.dio.post(ApiConstants.removeFromCart,
      data: {
        "cart_item_id":itemId
      });
      if (response.statusCode == 200) {
        return response.data["message"];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
