import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mens_app/screens/auth/widgets/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key,}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthScreen()));
    });
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'splashscreen',
      home: Scaffold(
        backgroundColor: Color(0xffCD9696),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                child: Image.asset('assets/Group.png'),
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                'MenstruApp',
                style: GoogleFonts.montserrat(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 35),
              const Spacer(),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}


