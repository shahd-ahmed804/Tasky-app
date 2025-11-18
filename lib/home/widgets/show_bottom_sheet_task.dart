
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tasky_app/auth/widgets/text_form_field.dart';
import 'package:tasky_app/core/constant/assets_constant.dart';
import 'package:tasky_app/core/utiles/validator.dart';

class ShowBottomSheetTask extends StatefulWidget {
  const ShowBottomSheetTask({super.key});

  @override
  State<ShowBottomSheetTask> createState() => _ShowBottomSheetTaskState();
}

class _ShowBottomSheetTaskState extends State<ShowBottomSheetTask> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Add Task",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff404147),
            ),),
          TextFormFieldWidget(controller: taskName,
              hintText: 'Enter Task Name',
              validator: Validator.validateName),
          SizedBox(height: 10,),
          TextFormFieldWidget(controller: description,
              hintText: 'Enter Description',
              validator: Validator.validateName),
          SizedBox(height: 10,),
          Row(
            children: [
              _iconInkWell(imagePath: AssetsConstant.Timer, onPressed: ()async{
                selectedDate= await showDatePicker(context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 60)),
                initialDate: DateTime.now(),
                )?? DateTime.now();
                log(selectedDate.day.toString());
              }),
              SizedBox(width: 10),
              _iconInkWell(imagePath: AssetsConstant.Flag, onPressed: (){}),
              const Spacer(),
              _iconInkWell(imagePath: AssetsConstant.Send, onPressed: (){}),
            ],
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget _iconInkWell({required String imagePath, required void Function() onPressed}){
    return InkWell(
      onTap: onPressed,
      child: Image.asset(imagePath ,height: 24,width: 24,fit: BoxFit.contain),

    );
  }
  late TextEditingController taskName;
  late TextEditingController description;
  late DateTime selectedDate ;
  @override
  void initState() {
    super.initState();
    taskName =TextEditingController();
    description = TextEditingController();
    selectedDate = DateTime.now();
  }
  @override
  void dispose() {
    super.dispose();
    taskName.dispose();
    description.dispose();
  }
}
