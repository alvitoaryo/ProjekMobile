import 'package:covid_19/hitung/konversi_uang.dart';
import 'package:covid_19/hitung/konversi_waktu.dart';
import 'package:flutter/material.dart';

class Hitung extends StatelessWidget {
  const Hitung({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perhitungan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>KonversiUang()),
                );
              },
              child: const Text('Konversi Mata Uang'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>KonversiWaktu()),
                );
              },
              child: const Text('Konversi Waktu'),
            ),
          ],
        ),
      ),
    );
  }
}
