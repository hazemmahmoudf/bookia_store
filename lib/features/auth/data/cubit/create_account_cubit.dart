import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repo/create_account_repo.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit() : super(CreateAccountInitial());


  createAccount (
      {
        required String name,
        required String email,
        required String password,
        required String confirmPassword,
      }
      )async{
    emit(CreateAccountLoading());
    debugPrint("create Account Calling");
    debugPrint("create account loading");
    final response=await CreateAccountRepo.createAccount(name: name, email: email, password: password, confirmPassword: confirmPassword);
    debugPrint(response.toString());
    if(response["status"]==201){
      _saveUserToken(response["data"]["token"]);
      emit(CreateAccountSuccess());
    }else{
      emit(CreateAccountError());
    }

  }
  void _saveUserToken(String token)async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }
}
