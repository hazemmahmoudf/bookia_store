import 'package:bookia/core/constants/api_constants.dart';
import 'package:bookia/core/services/network/network_service.dart';


class Login{
  static login({required String email,required String password})async{
  try {
     final repo=await NetworkService.dio.post(ApiConstants.login,data: {
      "email" : email,
      "password" : password
    });
    if(repo.statusCode==200){
      return repo.data;
    }
    else{
      return null;
    }
  }
  catch(e){
    return e;
  }
  }
  }
