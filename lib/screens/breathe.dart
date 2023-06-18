import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mens_app/screens/home.dart';
import 'package:mens_app/screens/kalender.dart';
import 'package:mens_app/screens/profile.dart';

class Breathe extends StatefulWidget {
  @override
  _Breathe createState() => _Breathe();
}

class _Breathe extends State<Breathe> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var whitype = GoogleFonts.montserrat(
        fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.w500);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff597d),
        title: Center(
            child: Text(
          'Inhale Exhale',
          style: whitype,
        )),
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: Lottie.network(
              'https://assets9.lottiefiles.com/packages/lf20_BTOE9j.json'),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: Color(0xffff597d),
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            print(index);
          },
          items: [
            GestureDetector(
              //menampilkan icon
              child: Icon(Icons.home),
              //pada saat icon  di tap
              onTap: () async {
                //berpindah ke halaman home
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            GestureDetector(
              //menampilkan icon
              child: Icon(Icons.add),
              //pada saat icon  di tap
              onTap: () async {
                //berpindah ke halaman tambah
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => Kalender()));
              },
            ),
            GestureDetector(
              //menampilkan icon
              child: Icon(Icons.person),
              //pada saat icon  di tap
              onTap: () async {
                //berpindah ke halaman profil
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => Profil()));
              },
            ),
          ]),
    );
  }
}
