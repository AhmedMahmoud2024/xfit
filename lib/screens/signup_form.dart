import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xfit/screens/theme.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}
class _SignUpFormState extends State<SignUpForm>{
TextEditingController name=TextEditingController();
TextEditingController email=TextEditingController();
TextEditingController phone=TextEditingController();
TextEditingController password=TextEditingController();
// TextEditingController name=TextEditingController();
// TextEditingController name=TextEditingController();

   bool _isObscure =true;
//   GlobalKey<State>  signUpFormState=GlobalKey<State>();
//   void sunmitForm(value){
//     if(value!.isEmpty){
//       return  ;
//   }

  Future regestratioUser() async{
    Map mapdata={
      'name': name.text,
      'email' : email.text.trim(),
      'phone' :phone.text,
      'password':password.text

    };
    http.Response response= await http.post(
       Uri.parse("https://x-fit-backend-graduation-project.vercel.app/api/v1/user/register"),body: mapdata
    );
    var data =jsonDecode(response.body);
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

   String? _validatePhone(value){
     if(value!.isEmpty){
       return "Please Enter a phone number" ;
     }
    if(value.length!=11){
      return "Please Enter a valid phone number" ;
    }
    return null;
   }


   Validator(value){

   }
  @override
  Widget build(BuildContext context) {
  return Column(
    children: [
      // buildPadding("First Name",false, (value){
      //   if(value!.isEmpty){
      //     return "please Enter The Field" ;
      //   } return null;
      // }),
      buildPadding("Full Name",false,(value){
        if(value.isEmpty){
          return "please Enter The Field" ;
        } return null;
      },TextInputType.name,
        name
      ),
      buildPadding("Email",false,_validateEmail ,TextInputType.emailAddress,email),
      buildPadding("Phone",false,
         _validatePhone
      ,TextInputType.phone,
        phone
      ),
      buildPadding("Password",true,(value){
        if(value.isEmpty){
          return "please Enter Your Password" ;
        } return null;
      },TextInputType.visiblePassword,
        password
      ),
      // buildPadding("Confirm Password",true,(value){
      // if(value!.isEmpty){
      // return "please Enter Reconfirmed password" ;
      // } return null;
      // }),
    ],
  );
  }

  Padding buildPadding(String hint, bool pass ,  Function(String value)? func,keyboardType,controller ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
    child: TextFormField(
     controller: controller,
  keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.always,
      validator: (value)=>func!(value!),

      obscureText: pass ? _isObscure:false,
      key:GlobalKey<_SignUpFormState>(),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: kTextFieldColor,
        ),
        border:OutlineInputBorder() ,
        // enabledBorder: OutlineInputBorder(
        //   borderRadius:BorderRadius.circular(80) ,
        //   borderSide: BorderSide(
        //       color: kPrimaryColor
        //   )
        //   ,
        // )
         // ,
        focusedBorder: OutlineInputBorder
          (
          borderRadius:BorderRadius.circular(80) ,
          borderSide: BorderSide(
            color: kPrimaryColor
          )
          ,
        ),
        suffixIcon: pass? IconButton(onPressed: (){
         setState(() {
           _isObscure =!_isObscure ;
         });
        }, icon:_isObscure? Icon(
          Icons.visibility_off,color: kPrimaryColor,
        ):Icon(
          Icons.visibility,color: kPrimaryColor,
        )
        )
        :null
      ),
    ),
    );
  }

}



