import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tasky_app/auth/view/login_screen.dart';
import 'package:tasky_app/core/constant/assets_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = "SplashScreen";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initSate(){
    super.initState();
    Future.delayed(Duration(seconds: 2),() {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5F33E1),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInLeft(
              duration: Duration(milliseconds: 900),
              child: Image.asset(
                  AssetsConstant.TaskIcon),
            ),
            BounceInDown(
              delay: Duration(milliseconds: 900),
              duration: Duration(milliseconds: 600) ,
              from: 50,
              child: Image.asset(
                  AssetsConstant.YIcon),
            ),

          ],
        ),
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