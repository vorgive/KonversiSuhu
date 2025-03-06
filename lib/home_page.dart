import 'package:flutter/material.dart';

void main() {
  runApp(KonversiSuhuApp());
}

class KonversiSuhuApp extends StatelessWidget {
  const KonversiSuhuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KonversiSuhuScreen(),
    );
  }
}

class KonversiSuhuScreen extends StatefulWidget {
  const KonversiSuhuScreen({super.key});

  @override
  KonversiSuhuScreenState createState() => KonversiSuhuScreenState();
}

class KonversiSuhuScreenState extends State<KonversiSuhuScreen> {
  final TextEditingController suhuController = TextEditingController();
  double celcius = 0;
  double fahrenheit = 0;
  double kelvin = 0;
  double reamur = 0;

  void konversiSuhu() {
    setState(() {
      double inputUser = double.tryParse(suhuController.text) ?? 0;
      celcius = inputUser;
      fahrenheit = (inputUser * 9 / 5) + 32;
      kelvin = inputUser + 273.15;
      reamur = inputUser * 4 / 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              color: Colors.lightGreenAccent,
              child: Text(
                'Konversi Suhu',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: suhuController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Masukkan suhu - dan +',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                padding: EdgeInsets.all(20),
                children: [
                  suhuBox('Celcius', celcius, '°C', Colors.blue),
                  suhuBox('Fahrenheit', fahrenheit, '°F', Colors.redAccent),
                  suhuBox('Kelvin', kelvin, 'K', Colors.purple),
                  suhuBox('Reamur', reamur, '°R', Colors.green),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: konversiSuhu,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreenAccent,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                ),
                child: Text(
                  'Konversikan',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget suhuBox(String title, double value, String symbol, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 5),
            Text(
              '${value.toStringAsFixed(2)} $symbol',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
