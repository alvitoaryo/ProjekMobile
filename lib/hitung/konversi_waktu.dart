import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class KonversiWaktu extends StatefulWidget {
  const KonversiWaktu({Key? key}) : super(key: key);

  @override
  State<KonversiWaktu> createState() => _KonversiWaktuState();
}

class _KonversiWaktuState extends State<KonversiWaktu> {
  String currentTime = '';
  String? selectedLocation; // Ubah menjadi nullable
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _updateCurrentTime();
    _updateConvertedTime();
  }

  void _updateCurrentTime() {
    setState(() {
      currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
    });

    // Perbarui waktu setiap detik
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
      });
    });
  }

  void _updateConvertedTime() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  String getConvertedTime() {
    if (selectedLocation == null) {
      return ''; // Nilai waktu terkonversi kosong jika lokasi belum dipilih
    }

    switch (selectedLocation) {
      case 'WIB':
        return convertTime('WIB', 0);
      case 'WITA':
        return convertTime('WITA', 1);
      case 'WIT':
        return convertTime('WIT', 2);
      case 'London':
        return convertTime('London', -7);
      default:
        return '';
    }
  }

  String convertTime(String location, int hoursToAdd) {
    DateTime now = DateTime.now().add(Duration(hours: hoursToAdd));
    return DateFormat('HH:mm:ss').format(now);
  }

  @override
  void dispose() {
    // Hentikan timer ketika widget dihapus
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konversi Waktu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Waktu saat ini: $currentTime',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              'Waktu terkonversi: ${getConvertedTime()}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedLocation,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedLocation = newValue;
                  });
                }
              },
              items: <String>['WIB', 'WITA', 'WIT', 'London']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
