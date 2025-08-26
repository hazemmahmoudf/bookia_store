import 'package:bookia/core/services/local/shared_prefs_helper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: IconButton(onPressed: ()async{
      await  SharedPrefsHelper.remove("token");
      Navigator.pushReplacementNamed(context,'/welcome');
      }, icon: Icon(Icons.login_outlined)),
      ),
    );
  }
}
