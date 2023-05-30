import 'package:covid_19/homepage.dart';
import 'package:covid_19/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:covid_19/model/data_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initiateLocalDB();
    runApp(const MaterialApp(
        debugShowCheckedModeBanner: false, home: LoginPage()));
  // runApp(const MyApp());
}

void initiateLocalDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DataModelAdapter());
  await Hive.openBox<DataModel>("data");
}
