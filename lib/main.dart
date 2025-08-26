import 'package:bookia/bookia_app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/services/network/network_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  NetworkService.dio;
  final prefs = await SharedPreferences.getInstance();

  runApp(
    BookiaApp(prefs: prefs,),
  );
}
