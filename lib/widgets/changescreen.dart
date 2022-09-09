import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ChangeScreen extends StatelessWidget {
 final String name;
  final String WhichAccount;
    final VoidCallback onTap;
   ChangeScreen({ required this.name,  required this.onTap,  required this.WhichAccount,});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(WhichAccount),
        SizedBox(width: 10,),
        GestureDetector(
         onTap:onTap,
          child: Text(name,style: TextStyle(color: Colors.cyan,fontSize: 20,fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
