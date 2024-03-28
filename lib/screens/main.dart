
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xfit/screens/provider/registration_screen.dart';
import 'package:xfit/screens/stepper/main.dart';
//import 'package:xfit/screens/provider/registration_screen.dart';

import 'login.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(
      MyApp()
  );
}

 class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return new MaterialApp(
     debugShowCheckedModeBanner: false,
     theme: ThemeData(fontFamily: 'Poppins'),
     home:MianStepper()
     //RegistrationScreen1()
     //RegistrationScreen()
     //MultiPageProvider()
    // LoginScreen(),
   ) ;
  }

 }