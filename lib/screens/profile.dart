import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
//import 'package:utp_mobile/WelcomeScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mens_app/screens/home.dart';
import 'package:mens_app/screens/kalender.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth/widgets/auth_screen.dart';
//import 'package:utp_mobile/PortoProfil.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _Profil();
}

class _Profil extends State<Profil> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    var boldtipe =
        GoogleFonts.montserrat(fontSize: 16.0, fontWeight: FontWeight.w500);

    var lighttipe = GoogleFonts.montserrat(
      fontSize: 14.0,
    );
    var whitype = GoogleFonts.montserrat(
        fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.w500);

    var greytipe = GoogleFonts.montserrat(fontSize: 14.0, color: Colors.grey);

    // var rowtipe = GoogleFonts.poppins(
    //   fontSize: 14.0,
    //   fontWeight: FontWeight.w400,
    //   color: Color(0xff2d3447),
    // );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff597d),
        title: Center(
            child: Text(
          'Profile',
          style: whitype,
        )),
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        actions: <Widget>[
          IconButton(
              onPressed: () {}, icon: Icon(Icons.edit, color: Colors.white)),
        ],
        elevation: 10,
      ),
      body: Column(
  children: [
    Container(
      margin: EdgeInsets.fromLTRB(50, 50, 50, 15),
      padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
      height: 250,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Color(0xffff597d), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/girl.jpg'),
          ),
          const SizedBox(height: 12),
          Text(
            'Anggika Sendakala Maharani',
            style: boldtipe,
          ),
          const SizedBox(height: 10),
          const Divider(
            height: 8,
            color: Color(0xff2d3447),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(
                'Email',
                style: greytipe,
              ),
              Spacer(),
              Text(
                'anggika014@gmail.com',
                style: lighttipe,
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                'Age',
                style: greytipe,
              ),
              Spacer(),
              Text(
                '20',
                style: lighttipe,
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                'Region',
                style: greytipe,
              ),
              Spacer(),
              Text(
                'Bogor, Jawa Barat',
                style: lighttipe,
              ),
            ],
          ),
        ],
      ),
    ),
    SizedBox(
      height: 25,
    ),
    Expanded(
      child: ListView(
        children: [
          Container(
            height: 50,
            width: 400,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xfff6f5f9),
            ),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.settings,
                  size: 25,
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  'Setting',
                  style: boldtipe,
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_right,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            height: 50,
            width: 400,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xfff6f5f9),
            ),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.notifications,
                  size: 25,
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  'Notification',
                  style: boldtipe,
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_right,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            height: 50,
            width: 400,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xfff6f5f9),
            ),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.logout,
                  size: 25,
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  'Log Out',
                  style: boldtipe,
                ),
                Spacer(),
                IconButton(
                  onPressed: () async {
                    final SharedPreferences? prefs = await _prefs;
                    prefs?.clear();
                    Get.offAll(AuthScreen());
                  },
                  icon: Icon(
                    Icons.arrow_right,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ],
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
  ],
),
);
  }}