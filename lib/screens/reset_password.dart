
import 'package:flutter/material.dart';
import 'package:xfit/screens/PrimaryButton.dart';
import 'package:xfit/screens/Validator/Validator.dart';
import 'package:xfit/screens/login.dart';
import 'package:xfit/screens/reset_form.dart';
import 'package:xfit/screens/theme.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ResetPasswordScreen extends StatefulWidget{
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController resetPassC = TextEditingController();
  final TextEditingController confirmResetPassC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kDefaultPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 200,),
              InkWell(onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>
                      LoginScreen()
                      // Validator(),
                    )
                );
              },
                child: Text(
                  "Reset Password",
                  style: titleText,
                ),
              ),
              SizedBox(height: 5,),
              Text(
                "Please enter your email address",
                style: subTitle.copyWith(
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: resetPassC,
                decoration: const InputDecoration(labelText: 'newPassword'),
                validator: (value) {
                  if (value!.isEmpty || value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              TextFormField(
                   controller: confirmResetPassC,
                decoration: const InputDecoration(labelText: 'confirmNewPassword'),
                validator: (value) {
                  if (value!.isEmpty || value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              // buidInputForm('newPassword', false,TextInputType.visiblePassword, _validateEmail),
              // buidInputForm('confirmNewPassword', false,TextInputType.visiblePassword, _validateEmail),

              //  ResetForm(),
              SizedBox(height: 40,),
              GestureDetector(
                  onTap: (){
                    postData4() async {
                      // final TextEditingController forgotPassEmailC = TextEditingController();
                      Map data4 = {

                        "newPassword":resetPassC.text.trim(),
                        "ConfirmNewPassword":confirmResetPassC.text.trim()

                      };
                      try {
                        print(data4.toString());
                        var response1;

                        http.Response response = await http.post(
                          Uri.parse(
                              "https://x-fit-backend-graduation-project-production.up.railway.app/api/v1/user/resetPassword/:token"),
                          headers: {
                            "Content-Type" : "application/json",
                            "Accept" : "application/json",
                          },
                          body: jsonEncode(data4),
                        );
                        print(response.body.toString());
                        print(response.body);

                        // jsonDecode(response.body);
                        //  var dataE= jsonEncode(response) as Map ;
                        if (response.statusCode == 200 || response.statusCode == 201 ||
                            response.statusCode == 204 ) {
                          final json=jsonDecode(response.body);

                          var token= json["user"]["token"];
                          print(token);
                          // Registration successful
                          print('Registration successful');
                        } else {
                          // Registration failed
                          print('Registration failed');
                        }

                        return response.body;
                        // return 5 ;
                      }catch(e){
                        print(e);
                      }
                    }
                    postData4();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=>LoginScreen()
                          ,
                        )
                    );
                  },
                  child: PrimaryButton(
                    buttonText: "Reset Password",
                  )
              )
              // ResetForm(),
            ],
          ),
        ),
      ),

    );
  }
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
Padding buidInputForm( label, bool pass,keyboardType,
    Function(String value)? func) {
  return Padding(
    padding:  EdgeInsets.only(top: 20),
    child: TextFormField(
      keyboardType: keyboardType,
      validator: (value)=>func!(value!),
      autovalidateMode: AutovalidateMode.always,
      decoration: InputDecoration(
          hintText: label,
          hintStyle: TextStyle(
              color: kTextFieldColor
          ),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: kPrimaryColor
              )
          )
      ),

    ),
  );
}
