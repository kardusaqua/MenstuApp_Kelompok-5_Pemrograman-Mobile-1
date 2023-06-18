import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
//import 'package:mens_app/screens/auth/widgets/auth_screen.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mens_app/screens/breathe.dart';
import 'package:mens_app/screens/kalender.dart';
import 'package:mens_app/screens/profile.dart';

//import 'auth/widgets/auth_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: ListView(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello Gorgeous',
                        style: GoogleFonts.montserrat(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87)),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Everyday is a good day')
                  ],
                ),
                Spacer(),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage(
                        "assets/girl.jpg",
                      )),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      border: Border.all(color: Color(0xffff597d), width: 4.0)),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text('Your Space',
                style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  height: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Colors.lightBlue),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Just Relax in Pain",
                              style: GoogleFonts.montserrat(
                                  fontSize: 20, color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "You Can Do It!",
                              style:
                                  GoogleFonts.montserrat(color: Colors.white),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            FloatingActionButton.extended(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => Breathe()));
                              },
                              backgroundColor: Colors.white,
                              label: Text("Go!",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.lime,
                                      fontWeight: FontWeight.w700)),
                              icon: Icon(
                                Icons.play_arrow,
                                color: Colors.lightBlue,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          'assets/meditaa.png',
                          width: 150,
                          height: 170,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Text('Tips and Information',
                style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InfoPage()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'thumbnail_image1.png',
                      width: 150,
                      height: 150,
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Yuk! Kenali Warnanya',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'Klik untuk membaca lebih lanjut informasi terkait menstruasi.',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi dan Tips Menstruasi'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Informasi Menstruasi',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Menstruasi adalah proses alami yang dialami oleh setiap wanita. Namun, tidak semua wanita memperhatikan warna darah yang keluar saat menstruasi. Padahal, warna darah menstruasi bisa menjadi indikator kondisi kesehatan wanita, terutama yang berkaitan dengan sistem reproduksi. Berikut ini adalah beberapa warna darah menstruasi yang bagus dan apa artinya.',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 10.0),
              Text(
                'Merah Muda',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Warna darah menstruasi merah muda biasanya muncul di awal atau akhir siklus menstruasi, ketika darah bercampur dengan cairan serviks atau lendir vagina. Warna ini menunjukkan bahwa darah segar dan mengalir dengan cepat dari rahim. Warna merah muda juga bisa terjadi karena kadar estrogen yang rendah, misalnya pada wanita yang mengonsumsi pil KB hormonal atau yang sedang menopause. Warna ini tidak perlu dikhawatirkan kecuali disertai gejala lain seperti nyeri, gatal, atau bau tidak sedap.',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 5.0),
              Text(
                'Merah Terang',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                'Warna darah menstruasi merah terang atau merah cerah adalah warna yang paling umum dan normal. Warna ini menandakan bahwa darah baru dan segar keluar dari rahim tanpa teroksidasi. Warna ini biasanya muncul di tengah siklus menstruasi, ketika aliran darah lebih banyak dan kental. Warna ini juga bisa menjadi tanda awal kehamilan, yaitu perdarahan implantasi yang terjadi ketika sel telur yang telah dibuahi menempel di dinding rahim. Warna ini perlu diwaspadai jika disertai dengan perdarahan berlebihan, nyeri hebat, atau demam.',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 5.0),
              Text(
                'Merah Gelap',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                'Warna darah menstruasi merah gelap atau merah tua adalah warna yang menunjukkan bahwa darah sudah lama berada di dalam rahim dan teroksidasi. Warna ini biasanya muncul di akhir siklus menstruasi, ketika aliran darah lebih sedikit dan lambat. Warna ini juga bisa terjadi karena adanya bekuan darah atau jaringan endometrium yang tertinggal di dalam rahim. Warna ini tidak perlu dikhawatirkan kecuali jika bekuan darah berukuran besar atau disertai dengan nyeri hebat.',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 5.0),
              Text(
                'Cokelat',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                'Warna darah menstruasi cokelat adalah warna yang menunjukkan bahwa darah sudah sangat lama berada di dalam rahim dan teroksidasi. Warna ini biasanya muncul di awal atau akhir siklus menstruasi, ketika aliran darah sangat sedikit dan lambat. Warna ini juga bisa terjadi karena adanya sisa-sisa darah dari siklus sebelumnya yang baru keluar dari rahim. Warna ini tidak perlu dikhawatirkan kecuali jika disertai dengan bau tidak sedap atau gejala infeksi.',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 5.0),
              Text(
                'Oranye',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                'Warna darah menstruasi oranye adalah warna yang menunjukkan bahwa darah bercampur dengan cairan serviks atau keputihan abnormal. Warna ini bisa terjadi karena adanya infeksi bakteri atau infeksi menular seksual yang menyebabkan peradangan pada vagina atau serviks. Warna ini perlu dikhawatirkan jika disertai dengan gejala seperti gatal, nyeri, bengkak, atau bau tidak sedap pada vagina.',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0),
              Text(
                'Tips Terkait Menstruasi',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Berikut adalah beberapa tips yang dapat membantu menghadapi menstruasi dengan lebih nyaman.',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}
