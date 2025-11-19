
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tasky_app/auth/widgets/text_form_field.dart';
import 'package:tasky_app/core/constant/assets_constant.dart';
import 'package:tasky_app/core/network/result_firebase.dart';
import 'package:tasky_app/core/utiles/app_dialog.dart';
import 'package:tasky_app/core/utiles/validator.dart';
import 'package:tasky_app/home/data/firebase/firebase_task.dart';
import 'package:tasky_app/home/data/model/task_model.dart';
import 'package:tasky_app/home/widgets/priority_dialog_widget.dart';

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
              keyboardType: TextInputType.text,
              validator: Validator.validateName),
          SizedBox(height: 10,),
          TextFormFieldWidget(controller: description,
              hintText: 'Enter Description',
              keyboardType: TextInputType.text,
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
              _iconInkWell(imagePath: AssetsConstant.Flag, onPressed: (){
                showDialog(context: context, builder: (context)=>
                PriorityDialogWidget(onTap: (index ) {
                  priorityIndex=index;
                },
                ),
                );
              }),
              const Spacer(),
              _iconInkWell(imagePath: AssetsConstant.Send, onPressed:
              _onPressedSendTask,
              ),
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
  void _onPressedSendTask()async{
    AppDialog.showLoading(context);
   final result = await FirebaseTask.addTask(TaskModel(
     title: taskName.text,
     description: description.text,
     date: selectedDate,
     priority: priorityIndex,

   ));
   switch(result){
     case SuccessFB<void>():
      Navigator.of(context).pop();
      Navigator.of(context).pop();
     case ErrorFB<void>():
       Navigator.of(context).pop();
       AppDialog.showError(context, error: result.messageError);
   }
  }
  late TextEditingController taskName;
  late TextEditingController description;
  late DateTime selectedDate ;
  late int priorityIndex ;
  @override
  void initState() {
    super.initState();
    taskName =TextEditingController();
    description = TextEditingController();
    selectedDate = DateTime.now();
    priorityIndex=1;
  }
  @override
  void dispose() {
    super.dispose();
    taskName.dispose();
    description.dispose();
  }
}









