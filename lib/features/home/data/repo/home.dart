import 'package:bookia/core/constants/api_constants.dart';
import 'package:bookia/core/services/network/network_service.dart';

class Home{
  static productAll()async{
    try{
   final  repo=await NetworkService.dio.get(ApiConstants.products);
   if(repo.statusCode==200){
     return repo.data;
   }
   else{
     return null;
   }
    }catch(e){
      return e;
    }
  }
}