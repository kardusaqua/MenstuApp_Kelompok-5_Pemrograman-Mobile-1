import 'package:flutter/material.dart';
import 'package:mens_app/screens/auth/widgets/auth_screen.dart';
import 'package:get/get.dart';
import 'package:mens_app/screens/breathe.dart';
import 'package:mens_app/screens/home.dart';
import 'package:mens_app/screens/splashscreen.dart';
import 'package:mens_app/screens/profile.dart';

main() async {
  runApp(GetMaterialApp(
    theme: ThemeData(
        useMaterial3: true,
      ),
    debugShowCheckedModeBanner: false,
    home: //AuthScreen(),
    SplashScreen(),
    //HomeScreen(),
    //Profil(),
    //Breathe()
    
  ));
}

