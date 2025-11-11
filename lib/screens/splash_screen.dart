import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = "SplashScreen";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff5F33E1),
      body: Row(
        children: [

        ],
      ),
    );
  }
}

//Manage your tasks , 700,32
//You can easily manage all of your daily tasks in DoMe for free ,400,16,#6E6A7CDE
//Create daily routine,700,32
//In Tasky  you can create your personalized routine to stay productive,400,16,#6E6A7CDE
//Orgonaize your tasks,700,32,#24252CDE
//You can organize your daily tasks by adding your tasks into separate categories,400,16,#6E6A7CDE