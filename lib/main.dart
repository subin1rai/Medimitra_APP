import 'package:firebase_core/firebase_core.dart';
import 'package:medimitra/Admin/Admin_login.dart';
import 'package:medimitra/Admin/add_medicine.dart';
import 'package:medimitra/Screens/HomeScreen/HomePage.dart';
import 'package:medimitra/Screens/Login_Register/Login.dart';
import 'package:medimitra/Screens/Login_Register/get_Start.dart';
import 'package:medimitra/Screens/Login_Register/register.dart';
import 'package:medimitra/pages/bottomNvarbar.dart';
import 'package:medimitra/pages/order.dart';
import 'package:medimitra/pages/profile.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medimitra',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: RegisterPage(),
    );
  }
}
