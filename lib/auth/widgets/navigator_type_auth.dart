import 'package:flutter/material.dart';

class NavigatorTypeAuthWidget extends StatelessWidget {
  const NavigatorTypeAuthWidget({super.key,
    required this.title, required this.subTitle,this.onTap});
  final String title;
  final String subTitle;
  final void Function()? onTap ;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Color(0xff6E6A7C)
            ),),
          Text(subTitle,
            style: TextStyle(
                fontSize: 13 ,
                fontWeight: FontWeight.w400,
                color: Color(0xff5F33E1)
            ),),
        ],
      ),
    );
  }
}