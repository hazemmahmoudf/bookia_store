import 'package:bookia/core/services/network/network_service.dart';

class CreateAccountRepo{


 static createAccount(
  {
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
}

      )async{

    try{
      final response =await NetworkService.dio.post("register",data: {
        "name":name,
        "email":email,
        "password":password,
        "password_confirmation":confirmPassword
      });
      if(response.statusCode==201){
        return response.data;
      }
      else{
        return null;
      }
    }catch(e){
      return e;
    }
  }


}