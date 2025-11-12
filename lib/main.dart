import 'package:flutter/material.dart';
import 'package:tasky_app/auth/view/login_screen.dart';
import 'package:tasky_app/auth/view/register_screen.dart';
import 'package:tasky_app/firebase_options.dart';
import 'package:tasky_app/screens/onbording_screen.dart';
import 'package:tasky_app/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main()async{
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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routeName,
        routes:{
          LoginScreen.routeName : (context)=> LoginScreen(),
          RegisterScreen.routeName : (context)=> RegisterScreen(),
          SplashScreen.routeName :(context)=>SplashScreen(),
          OnbordingScreen.routeName : (context)=>OnbordingScreen(),
        }
    );
  }
}
