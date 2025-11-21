
import 'dart:developer';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasky_app/auth/view/login_screen.dart';
import 'package:tasky_app/core/constant/assets_constant.dart';
import 'package:tasky_app/core/network/result_firebase.dart';
import 'package:tasky_app/core/utiles/app_dialog.dart';
import 'package:tasky_app/home/data/firebase/firebase_task.dart';
import 'package:tasky_app/home/data/model/task_model.dart';
import 'package:tasky_app/home/widgets/item_card_widget.dart';
import 'package:tasky_app/home/widgets/show_bottom_sheet_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List  <TaskModel> listOfTasks =[];
  DateTime _selectedValue=DateTime.now();
  bool isLoading=false;
  @override
  void initState() {
    super.initState();
    getTask(_selectedValue);
  }
  void getTask(DateTime date)async{
    isLoading=true;
   final result =await FirebaseTask.getTasks(date);
   switch(result) {
     case SuccessFB<List<TaskModel>>():
      listOfTasks = result.data??[];
      log("List of task $listOfTasks");
     case ErrorFB<List<TaskModel>>():
       AppDialog.showError(context, error: result.messageError);
   }
   isLoading=false;
   setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AssetsConstant.HomeLogo),
        actions: [
         InkWell(
           onTap: () async{
           await  FirebaseAuth.instance.signOut();
           Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
           },
           child: Row(
             children: [
               Image.asset(AssetsConstant.Logout),
               SizedBox(width: 10),
               Text("Log out",style: TextStyle(
                 fontSize: 16,
                 fontWeight: FontWeight.w400,
                 color: Color(0xffFF4949),
               ),
               ),
             ],
           ),
         ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DatePicker(
            DateTime.now(),
            height: 100,
            initialSelectedDate: DateTime.now(),
            selectionColor: Color(0xff5F33E1),
            selectedTextColor: Colors.white,
            onDateChange: (date) async{
              _selectedValue =date;
              getTask(date);
              setState(() {});
            },
          ),
         isLoading ?_loadingState(): _listOfTasks(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff24252C),
        shape: CircleBorder(),
        onPressed: _onPressedAddTask,
      child: Icon(Icons.add, color: Color(0xff5F33E1)),),
    );
  }
  void _onPressedAddTask(){
   showModalBottomSheet(context: context,
     isScrollControlled: true,
       builder: (context)=>ShowBottomSheetTask()
   ).whenComplete(()async{
      print("when complete");
      getTask(_selectedValue);
   });
  }
  Widget _loadingState(){
    return  Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator()],
      ),
    );
  }
  Widget _listOfTasks(){
    return listOfTasks.isEmpty ? _emptyState(): Expanded(child: ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      itemBuilder:(context,index)=>
          ItemCardWidget(title:listOfTasks[index].title??"",
            date: listOfTasks[index].date??DateTime.now(),
            priority: listOfTasks[index].priority??1,
            isCompleted: listOfTasks[index].isCompleted??false,
          ),
      itemCount: listOfTasks.length,
      separatorBuilder: (context,index)=> SizedBox(height: 10),
    ));
  }
  Widget _emptyState(){
  return  Center(
    child: Column(
      children: [
        SizedBox(height: 90,),
        Image.asset(AssetsConstant.homepage),
        SizedBox(height: 10,),
        Text("What do you want to do today?",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Color(0xff24252C),
          ),),
        SizedBox(height: 10,),
        Text("Tap + to add your tasks",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xff404147),
          ),),
      ],
    ),
  );
  }
}






