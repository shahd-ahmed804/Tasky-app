import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tasky_app/auth/view/login_screen.dart';
import 'package:tasky_app/auth/view/register_screen.dart';
import 'package:tasky_app/firebase_options.dart';
import 'package:tasky_app/home/view/home_screen.dart';
import 'screens/onbording_screen.dart';
import 'screens/splash_screen.dart';


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
        initialRoute: HomeScreen.routeName,
        routes:{
          LoginScreen.routeName : (context)=> LoginScreen(),
          RegisterScreen.routeName : (context)=> RegisterScreen(),
          SplashScreen.routeName :(context)=>SplashScreen(),
          OnbordingScreen.routeName : (context)=>OnbordingScreen(),
          HomeScreen.routeName : (context)=> HomeScreen(),
          //HomeScreen.routeName : (context)=> HomeScreen(),
        }
    );
  }
}
