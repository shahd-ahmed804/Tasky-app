import 'package:flutter/material.dart';
import 'package:tasky_app/auth/widgets/text_form_field.dart';
import 'package:tasky_app/core/constant/assets_constant.dart';
import 'package:tasky_app/core/utiles/validator.dart';
import 'package:tasky_app/home/widgets/show_bottom_sheet_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AssetsConstant.HomeLogo),
        actions: [
          Image.asset(AssetsConstant.Logout),
          SizedBox(width: 10),
          Text("Log out",style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xffFF4949),
          ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Center(
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
       builder: (context)=>ShowBottomSheetTask());
  }
}
