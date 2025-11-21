
import 'package:flutter/material.dart';
import 'package:tasky_app/core/constant/assets_constant.dart';

class ItemCardWidget extends StatelessWidget {
  const ItemCardWidget({super.key, required this.title,
    required this.date, required this.priority, required this.isCompleted,
    this.onPressed});
  final String title;
  final DateTime date;
  final int priority;
  final bool isCompleted;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff6E6A7C),width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Radio(value: true, onChanged:(value) {
            onPressed;
          },
              groupValue: true),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff24252C),
                ),),
              Text(
                _formatDate(date),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff24252C),
                ),),
            ],
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Color(0xff6E6A7C)),
            ),
            padding: EdgeInsets.all(7),
            margin: EdgeInsets.only(right: 10,bottom: 7),
            child: Row(
              children: [
                Image.asset(AssetsConstant.Flag,
                  width: 24,height: 24,fit: BoxFit.contain,
                ),
                SizedBox(height: 5,),
                Text(priority.toString(),style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff27282F),
                ),),
              ],
            ),
          ),

        ],
      ),
    );
  }
  String _formatDate(DateTime date){
    return '${date.day}/${date.month}/${date.year}';
  }
}