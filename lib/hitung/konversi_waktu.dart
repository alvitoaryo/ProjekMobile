import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class KonversiWaktu extends StatefulWidget {
  const KonversiWaktu({Key? key}) : super(key: key);

  @override
  State<KonversiWaktu> createState() => _KonversiWaktuState();
}

class _KonversiWaktuState extends State<KonversiWaktu> {
  String currentTime = '';

  @override
  void initState() {
    super.initState();
    _updateCurrentTime();
  }

  void _updateCurrentTime() {
    setState(() {
      currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
    });
    Future.delayed(const Duration(seconds: 1), _updateCurrentTime);
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
          Text('Waktu saat ini: $currentTime',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              DateTime now = DateTime.now();
              String waktuWIB = DateFormat('HH:mm').format(now);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Waktu WIB'),
                    content: Text('Waktu saat ini di WIB: $waktuWIB'),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          },
                        child: const Text('Tutup'),
                      ),
                    ],
                  );
                  },
              );
              },
            child: const Text('Waktu WIB'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              DateTime now = DateTime.now().add(const Duration(hours: 1));
              String waktuWITA = DateFormat('HH:mm').format(now);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Waktu WITA'),
                    content: Text('Waktu saat ini di WITA: $waktuWITA'),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          },
                        child: const Text('Tutup'),
                      ),
                    ],
                  );
                  },
              );
              },
            child: const Text('Waktu WITA'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              DateTime now = DateTime.now().add(const Duration(hours: 2));
              String waktuWIT = DateFormat('HH:mm').format(now);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Waktu WIT'),
                    content: Text('Waktu saat ini di WIT: $waktuWIT'),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          },
                        child: const Text('Tutup'),
                      ),
                    ],
                  );
                  },
              );
              },
            child: const Text('Waktu WIT'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              DateTime now = DateTime.now().subtract(const Duration(hours: 7));
              String waktuLondon = DateFormat('HH:mm').format(now);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Waktu London'),
                    content: Text('Waktu saat ini di London: $waktuLondon'),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          },
                        child: const Text('Tutup'),
                      ),
                    ],
                  );
                  },
              );
              },
            child: const Text('Waktu London'),
          ),
        ],
      ),
    )
    );
  }
}
