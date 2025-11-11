import 'package:flutter/material.dart';
import 'package:tasky_app/auth/view/register_screen.dart';
import 'package:tasky_app/auth/widgets/navigator_type_auth.dart';
import 'package:tasky_app/auth/widgets/text_form_field.dart';
import 'package:tasky_app/utiles/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email = TextEditingController();
  var password = TextEditingController();
  var fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: fromKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 122),
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff24252C),
                  ),
                ),
                SizedBox(height: 53),
                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff24252C),
                  ),
                ),
                SizedBox(height: 5),
                TextFormFieldWidget(
                  controller: email,
                  hintText: "Enter Your Email",
                  validator: Validator.validateEmail,
                ),
                SizedBox(height: 26),
                Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff24252C),
                  ),
                ),
                SizedBox(height: 5),
                TextFormFieldWidget(
                  controller: password,
                  hintText: "Enter Your password",
                  validator: Validator.validatePassword,
                  isPassword: true,
                  obscureText: true,
                ),
                SizedBox(height: 70),
                MaterialButton(
                  color: Color(0xff5F33E1),
                  height: 50,
                  minWidth: 350,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onPressed: () {
                    if(fromKey.currentState!.validate()){}
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
                SizedBox(height: 14),
              ],
            ),
          ),
        ),
      floatingActionButton:  NavigatorTypeAuthWidget(
          title: "Don’t have an account? ",
          subTitle: " Register ",
          onTap: () {
            Navigator.of(context).pushNamed(RegisterScreen.routeName);
          })
      );
  }
}