import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mens_app/screens/home.dart';
import 'package:mens_app/screens/profile.dart';

void main() {
  runApp(Kalender());
}

class Kalender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pelacak Siklus Menstruasi',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/result': (context) => ResultPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  DateTime? shortCycleDate;
  DateTime? longCycleDate;

  void _showShortCycleDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2099),
    ).then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          shortCycleDate = pickedDate;
        });
      }
    });
  }

  void _showLongCycleDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2099),
    ).then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          longCycleDate = pickedDate;
        });
      }
    });
  }

  void _saveData() {
    if (shortCycleDate != null && longCycleDate != null) {
      Navigator.pushNamed(context, '/result', arguments: {
        'shortCycleDate': shortCycleDate,
        'longCycleDate': longCycleDate,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Input Tanggal Siklus'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Center(
              child: Image.asset(
                'assets/menstruation_info.png',
                width: 300,
                height: 250,
              ),
            );
          } else if (index == 1) {
            return SizedBox(height: 20);
          } else if (index == 2) {
            return Center(
              child: Text(
                'Pilih Tanggal Siklus',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else if (index == 3) {
            return Column(
              children: [
                ElevatedButton(
                  onPressed: _showShortCycleDatePicker,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Tanggal Siklus Pendek',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _showLongCycleDatePicker,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Tanggal Siklus Panjang',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _saveData,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Simpan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return SizedBox();
          }
        },
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
            child: Icon(Icons.home),
            onTap: () async {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          GestureDetector(
            child: Icon(Icons.add),
            onTap: () async {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Kalender()));
            },
          ),
          GestureDetector(
            child: Icon(Icons.person),
            onTap: () async {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profil()));
            },
          ),
        ],
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (arguments != null) {
      final DateTime shortCycleDate = arguments['shortCycleDate'] as DateTime;
      final DateTime longCycleDate = arguments['longCycleDate'] as DateTime;
      final menstrualCycle = MenstrualCycle(shortCycleDate, longCycleDate);
      final menstrualPhase = menstrualCycle.getMenstrualCyclePhase();
      final safePeriod = menstrualCycle.getSafePeriod();

      return Scaffold(
        appBar: AppBar(
          title: Text('Hasil Perhitungan Siklus'),
          centerTitle: true,
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(20.0),
            children: [
              Image.asset(
                'assets/menstruation_ornament.png',
                width: 350,
                height: 350,
              ),
              Text(
                'Informasi Menstruasi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Menstruasi terdiri dari empat fase yaitu fase menstruasi (peluruhan lapisan rahim karena tidak terjadi pembuahan pada sel telur), fase folikuler (sebelum telur dilepaskan), fase ovulasi (pelepasan telur) dan fase luteal (setelah sel telur dilepaskan). Menstruasi sangat berhubungan dengan faktor-faktor yang memengaruhi ovulasi, jika proses ovulasi teratur maka siklus menstruasi akan teratur.',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Siklus Menstruasi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Fase : $menstrualPhase',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 5),
              Text(
                safePeriod,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Tanggal Siklus Yang Dipilih',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Tanggal Siklus Pendek Dipilih  : ${shortCycleDate.day}-${shortCycleDate.month}-${shortCycleDate.year}',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Tanggal Siklus Panjang Dipilih : ${longCycleDate.day}-${longCycleDate.month}-${longCycleDate.year}',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Hasil Siklus Menstruasi'),
        ),
        body: Center(
          child: Text(
            'Invalid data',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
  }
}

class MenstrualCycle {
  final DateTime shortCycleDate;
  final DateTime longCycleDate;

  MenstrualCycle(this.shortCycleDate, this.longCycleDate);

  String getMenstrualCyclePhase() {
    final difference = longCycleDate.difference(DateTime.now()).inDays;

    if (difference < 0) {
      return 'Invalid date';
    } else if (difference < 4) {
      return 'Menstruation phase';
    } else if (difference < 11) {
      return 'Follicular phase';
    } else if (difference < 18) {
      return 'Ovulation phase';
    } else if (difference < 25) {
      return 'Luteal phase';
    } else {
      return 'Pre-menstruation phase';
    }
  }

  String getSafePeriod() {
    final safeStart = longCycleDate.subtract(Duration(days: 20));
    final safeEnd = shortCycleDate.subtract(Duration(days: 10));

    return 'Safe Period : ${safeStart.day}-${safeEnd.day}';
  }
}

