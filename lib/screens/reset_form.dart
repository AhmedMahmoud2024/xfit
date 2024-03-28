
import 'package:flutter/material.dart';
import 'package:xfit/screens/theme.dart';

class ResetForm extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
       decoration: InputDecoration(
         hintText: "Email",
         hintStyle: TextStyle(
           color: kTextFieldColor
         ),
         border:OutlineInputBorder() ,
         focusedBorder: OutlineInputBorder(
           borderSide: BorderSide(
             color: kPrimaryColor
           )
         )
       ),

      ),
    );
  }
}
