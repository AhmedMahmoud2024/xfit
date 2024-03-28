

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xfit/screens/theme.dart';
import 'package:http/http.dart' as http;
class LogInForm extends StatefulWidget{


  @override
  _LogInFormState createState() =>  _LogInFormState();
}
 class _LogInFormState extends State<LogInForm>{
   GlobalKey<FormState> globalKey=new GlobalKey<FormState>();
   GlobalKey<FormState> globalK=new GlobalKey<FormState>();

   TextEditingController email=TextEditingController();

   TextEditingController password=TextEditingController();
  bool _isObscure =true;
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        buidInputForm(
            "Email",false ,TextInputType.emailAddress,
            _validateEmail,
          email,
          globalKey
        ),
        buidInputForm(
            "password",true,TextInputType.visiblePassword,
                (value){
                  if(value.isEmpty){
                    return "please Enter Your Password" ;
                  } return null;
            },
          password,

          globalK
        )

      ],
    );
  }

  String? _validateEmail(value){
    if(value!.isEmpty){
      return "Please Enter an email" ;
    }
    RegExp  emailRegExp=RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if(!emailRegExp.hasMatch(value)){
      return "Please Enter a valid email" ;
    }
    return null;
  }

  Padding buidInputForm(
      String label,bool pass,keyboardType ,
       Function(String value)? func,
      controller,key
      )
  {
  //  bool _isObscure =true;
    return    Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        key: key,
        controller:controller ,
        autovalidateMode: AutovalidateMode.always,
        validator: (value)=>func!(value!),
        keyboardType:keyboardType,
        obscureText: pass ? _isObscure:false,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: kTextFieldColor),
            border:OutlineInputBorder() ,
            focusedBorder: OutlineInputBorder(
                borderSide:BorderSide(color: kPrimaryColor)
            )  ,
            suffixIcon: pass
                ? IconButton(onPressed: (){
              setState(() {
                _isObscure =! _isObscure ;
              });
            },
              icon: Icon(
                  _isObscure? Icons.visibility_off :Icons.visibility,
                color: kPrimaryColor,
              ),
            )
                :null

        ),


      ),
    );
  }

}

