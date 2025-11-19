import 'package:flutter/material.dart';
import 'package:tasky_app/core/constant/assets_constant.dart';


class PriorityDialogWidget extends StatefulWidget {
  const PriorityDialogWidget({super.key, required this.onTap});
  final void Function(int) onTap;

  @override
  State<PriorityDialogWidget> createState() => _PriorityDialogWidgetState();
}

class _PriorityDialogWidgetState extends State<PriorityDialogWidget> {
  List<int> priorityList =List.generate(10, (index) => index+1);
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          Text("Task Priority",style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xff27282F),
          ),),
          Divider(),
        ],
      ),
      content: Wrap(
        children:
        priorityList.map((index) =>_PriorityItemWidget
          (index: index,
          isSelected: selectedIndex ==index ,
          onTap: (){
            selectedIndex=index;
            widget.onTap(index);
            setState(() {

            });
          },
        ),).toList(),

      ),
    );
  }
}


class _PriorityItemWidget extends StatelessWidget {
  const _PriorityItemWidget({required this.index,
    this.onTap,
    required this.isSelected});
  final int index ;
  final void Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: isSelected ? null :Border.all(color: Color(0xff6E6A7C)),
          color: isSelected ? Color(0xff5F33E1) : null,
        ),
        padding: EdgeInsets.symmetric(vertical: 7,horizontal: 20),
        margin: EdgeInsets.only(left: 16,bottom: 12),
        child: Column(
          children: [
            Image.asset(AssetsConstant.Flag,
              width: 24,height: 24,fit: BoxFit.contain,
              color: isSelected ? Colors.white : null,
            ),
            SizedBox(height: 5,),
            Text(index.toString(),style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: isSelected ? Colors.white :Color(0xff27282F),
            ),),
          ],
        ),
      ),
    );
  }
}