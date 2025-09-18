import 'package:bookia/core/constants/api_constants.dart';
import 'package:bookia/core/services/network/network_service.dart';
import 'package:bookia/features/home/data/models/banner_model.dart';
import 'package:bookia/features/home/data/models/best_seller_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/services/local/shared_prefs_helper.dart';

class Home {
  static bestSeller() async {
    try {
      final repo = await NetworkService.dio.get(
        ApiConstants.products,
      );
      if (repo.statusCode == 200) {
        return BestSeller.fromJson(repo.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static sliderImage() async {
    try {
      final repo = await NetworkService.dio.get(ApiConstants.sliders);
      if (repo.statusCode == 200) {
        return BannerModel.fromJson(repo.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

 static addToCard(int idProduct) async {

   NetworkService.dio.options.headers={
       "authorization":"Bearer ${SharedPrefsHelper.getString('token')}"

   };
    try {
      Response repo = await NetworkService.dio.post(
        ApiConstants.addToCard,
        data: {"product_id": idProduct},
      );
      if (repo.statusCode == 201) {
        return repo.data["message"];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
  static booksSearch(String name) async {

    try {
      Response repo = await NetworkService.dio.get(
        ApiConstants.booksSearch,
        queryParameters: {"name": name},
      );
      if (repo.statusCode == 200) {
        return BestSeller.fromJson(repo.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

}
