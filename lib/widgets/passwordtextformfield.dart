import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class PasswordTextFormField extends StatelessWidget {
  final bool obscureText;
  final String name;
  final VoidCallback onTap;
  final TextEditingController controller;
   PasswordTextFormField({Key? key,  required this.obscureText,  required this.name,  required this.onTap,  required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: name,
          suffixIcon: GestureDetector(
            onTap:onTap,
            child: Icon(obscureText==true?Icons.visibility:Icons.visibility_off,color: Colors.black,),
          ),
          hintStyle: TextStyle(color: Colors.black)
      ),
    );
  }
}
