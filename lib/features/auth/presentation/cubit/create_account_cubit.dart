import 'package:bloc/bloc.dart';
import 'package:bookia/core/services/local/shared_prefs_helper.dart';
import 'package:bookia/features/auth/data/repo/login.dart';
import 'package:flutter/cupertino.dart';

import '../../data/repo/create_account_repo.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit() : super(CreateAccountInitial());

  // register
  createAccount({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(CreateAccountLoading());
    debugPrint("create Account Calling");
    debugPrint("create account loading");

  try{
    final response = await CreateAccountRepo.createAccount(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
    debugPrint(response.toString());
    if (response["status"] == 201) {
     await SharedPrefsHelper.setString("token", response['data']['token']);
      // _saveUserToken(response["data"]["token"]);
      emit(CreateAccountSuccess());
    } else {
      emit(CreateAccountError(response["message"]?? "Registration failed"));
    }
  }
      catch(e){
        emit(CreateAccountError("Validation Error"));
      }
  }

  // void _saveUserToken(String token) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString("token", token);
  // }

  //   login
  login({required String email, required String password})async {
    emit(LoginLoading());
   try{
     final repo=await Login.login(email: email, password: password);
     if(repo["status"]==200){
       await SharedPrefsHelper.setString("token", repo['data']['token']);
       emit(LoginSuccess("Login successfully"));
     }else if(repo==null){
       emit(LoginError("The email or password is not registered"));
     }
   }catch(e){
     emit(LoginError("The email or password is not registered"));
   }
  }
  void reset() {
    emit(CreateAccountInitial());
  }
}
