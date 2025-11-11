import 'package:flutter/material.dart';
import 'package:tasky_app/auth/widgets/text_form_field.dart';
import 'package:tasky_app/utiles/validator.dart';
import '../widgets/navigator_type_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = "RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var email = TextEditingController();
  var password = TextEditingController();
  var ConfirmPassword = TextEditingController();
  var Username = TextEditingController();
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
                  SizedBox(height: 90),
                  Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff24252C),
                    ),
                  ),
                  SizedBox(height: 23),
                  Text(
                    'Username',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff24252C),
                    ),
                  ),
                  TextFormFieldWidget(
                    controller: Username,
                    hintText: " enter user name",
                    validator: Validator.validateName,
                  ),
                  SizedBox(height: 12),
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
                    hintText: "enter your email",
                    validator: Validator.validateEmail,
                  ),
                  SizedBox(height: 12),
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
                    hintText: "Strong password",
                    validator: Validator.validatePassword,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Confirm password',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff24252C),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextFormFieldWidget(
                    controller: ConfirmPassword,
                    hintText: " password",
                    validator: Validator.validatePassword,
                  ),
                  SizedBox(height: 100),
                  MaterialButton(
                    color: Color(0xff5F33E1),
                    height: 50,
                    minWidth: 350,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                  SizedBox(height: 14),
                ]),
          )),
      floatingActionButton: NavigatorTypeAuthWidget(
          title: "Already have an account? ",
          subTitle: " Login ",
          onTap: () {
            Navigator.of(context).pop();
          }),
    );
  }
}
