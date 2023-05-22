import 'package:flutter/material.dart';
import 'profile.dart';
import 'package:covid_19/homepage.dart';
import '../hitung/hitung.dart'; // Import hitung.dart

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  final _screenList = [
    const HomePage(),
    const ProfileScreen(),
    const Hitung(), // Tambahkan Halaman Perhitungan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profil',
          ),
          BottomNavigationBarItem( // Tambahkan item untuk Perhitungan
            icon: Icon(Icons.calculate_rounded),
            label: 'Perhitungan',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
