import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'landlord_dashboard.dart';
import 'login.dart';
import 'signup.dart';
import 'tenant_dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Landlord Tenant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(), // Starting with the Login Screen
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/home': (context) => HomeScreen(),
        '/landlord_dashboard': (context) => LandlordDashboard(),
        '/tenant_dashboard': (context) => TenantDashboard(),
      },
    );
  }
}
