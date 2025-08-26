import 'package:bookia/bookia_app.dart';
import 'package:bookia/core/services/local/shared_prefs_helper.dart';
import 'package:flutter/material.dart';


import 'core/services/network/network_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  NetworkService.dio;
  await SharedPrefsHelper.initSharedPref();

  runApp(
    BookiaApp(),
  );
}
