import 'package:chart/loginPage/token_check.dart';
import 'package:chart/screen/home.dart';
import 'package:chart/screen/patient/patient.dart';
import 'package:chart/screen/plan.dart';
import 'package:chart/screen/splash_screen.dart';
import 'package:chart/screen/therapist.dart';
import 'package:flutter/material.dart';
import 'package:chart/config/my_sql_connector.dart';

void main() {
  dbConnector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => TokenCheck(),
        '/home': (context) => Home(),
        '/therapist': (context) => Therapist(),
        '/patient': (context) => Patient(),
        '/plan': (context) => Plan(),
      },
    );
  }
}
