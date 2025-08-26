import 'package:bloc/bloc.dart';
import 'package:bookia/core/services/local/shared_prefs_helper.dart';
import 'package:bookia/features/auth/data/repo/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repo/create_account_repo.dart';

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
      SharedPrefsHelper.setString("token", response['data']['token']);
      // _saveUserToken(response["data"]["token"]);
      emit(CreateAccountSuccess());
    } else {
      emit(CreateAccountError());
    }
  }
      catch(e){
        emit(CreateAccountError());
      }
  }

  // void _saveUserToken(String token) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString("token", token);
  // }

  //   login
  login({required String email, required String password})async {
    final repo=await Login.login(email: email, password: password);
    emit(LoginLoading());
    if(repo["status"]==200){
      SharedPrefsHelper.setString("token", repo['data']['token']);
      emit(LoginSuccess());
    }else{
      emit(LoginError());
    }
  }
}
