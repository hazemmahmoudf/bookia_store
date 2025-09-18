import 'package:bookia/core/constants/api_constants.dart';
import 'package:bookia/core/services/local/shared_prefs_helper.dart';
import 'package:bookia/core/services/network/network_service.dart';
import 'package:bookia/features/person/data/model/profile_model.dart';
import 'package:dio/dio.dart';

class PersonRepo {
  static Future<ProfileModel?> getPerson() async {
    NetworkService.dio.options.headers = {
      if (SharedPrefsHelper.getString('token') != null)
        "authorization": "Bearer ${SharedPrefsHelper.getString('token')}",
    };
    try {
      Response response = await NetworkService.dio.get(ApiConstants.profile);
      if (response.statusCode == 200) {
        return ProfileModel.fromJson(response.data);
      } else {
        null;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  static Future<ProfileModel?> updateProfile({String? name}) async {
    NetworkService.dio.options.headers = {
      if (SharedPrefsHelper.getString('token') != null)
        "authorization": "Bearer ${SharedPrefsHelper.getString('token')}",
    };
    try {
      Response response = await NetworkService.dio.post(ApiConstants.updateProfile,
      data: {
        "name":name,
        "address" :"Giza",
        "phone":"010101010100"
      });
      if (response.statusCode == 200) {
        return ProfileModel.fromJson(response.data);
      } else {
        null;
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
