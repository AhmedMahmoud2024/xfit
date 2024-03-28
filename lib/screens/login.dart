import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:xfit/screens/PrimaryButton.dart';
import 'package:xfit/screens/logIn_option.dart';
import 'package:xfit/screens/mvp/login_model.dart';
import 'package:xfit/screens/forget_password.dart';
import 'package:xfit/screens/reset_password.dart';
import 'package:xfit/screens/signup.dart';
import 'package:xfit/screens/stepper/googleLoggedInpage.dart';
import 'package:xfit/screens/stepper/main.dart';
//import 'package:xfit/screens/signup.dart';
import 'package:xfit/screens/theme.dart';
import 'package:http/http.dart' as http;
import 'login_form.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen( {super.key});


  @override


  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> globalKey=new GlobalKey<FormState>();
  final  TextEditingController emailCo=TextEditingController();
  final  TextEditingController passCo=TextEditingController();



 // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //  requestModel=LoginRequestModel(email: email.text.trim(), password: password.text);
  // }
  @override

  Widget build(BuildContext context) {
    Future signIn() async {
      GoogleSignInAccount? googleSignInAccount = await GoogleSignInApi.login();

      if(googleSignInAccount==null){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Sign In Failed'),));


      }
      else  {
            MaterialPageRoute(
                builder: (context) =>
                    LoggedInPage( googleSignInAccount:googleSignInAccount)
            );

      }
    }
  return Scaffold(
    body: Padding(
      padding:kDefaultPadding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
            ),
            Text("Welcome Back",style:titleText,),
            SizedBox(height: 5,),
            Row(
              children: [
                Text("New To This App?",style: subTitle,),
                SizedBox(width: 5,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=>MianStepper(),
                        )
                    );
                  },
                  child: Text(
                    "Sign Up",style: textButton.copyWith(
                      decoration: TextDecoration.underline,
                    decorationThickness: 1
                  ),
                  ),
                )
              ],
            ),
            TextFormField(
              controller: emailCo,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value!.isEmpty || !value.contains('@')) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            TextFormField(
              controller: passCo,
              decoration: const InputDecoration(labelText: 'Password'),
              validator: (value) {
                if (value!.isEmpty || value.length < 6) {
                  return 'Password must be at least 6 characters long';
                }
                return null;
              },
            ),
            SizedBox(height: 20,),

            GestureDetector(
              onTap: (){

                postDataLogin();
                  //postDataLogin();
                 // print(requestModel.toJson());

              },
                child: PrimaryButton(buttonText:'Log In')),
            SizedBox(height: 25,),
            GestureDetector(
              onTap: (){
              //  getData();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>ForgotPasswordScreen(),
                    )
                );
              },
              child: Text(
                "Forgot Password?" ,
                style:TextStyle(
                    color: kZambeziColor,
                    fontSize: 14,
                    decoration: TextDecoration.underline ,
                  decorationThickness: 1
              ),
              ),
            ),
            SizedBox(height: 15,),
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>ResetPasswordScreen(
                        
                      ),
                    )
                );
              },
              child: Text(
                "Reset Password?" ,
                style:TextStyle(
                    color: kZambeziColor,
                    fontSize: 14,
                    decoration: TextDecoration.underline ,
                    decorationThickness: 1
                ),
              ),
            ),
            SizedBox(height: 15,),
            GestureDetector(
              onTap:   signIn ,
              child: Text(
                "Or Log in with",
                style:subTitle.copyWith(color: kBlackColor) ,
              ),
            ),
            SizedBox(height: 20,),

            GestureDetector(

              onTap:()=>onButtonTapped(context),

              //()
              // async{
              //   var user= await GoogleSignInApi.login();
              //   if(user!=null){
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => SuccessLogin(name: user.displayName!, email: user.email)
              //       )
              //     );
              //   }
              // },
    //(){

         //       signIn,
              //   Navigator.push(
              //     context,
              //       MaterialPageRoute(
              //           builder: (context) =>
              //               LoggedInPage(googleSignInAccount:googleSignInAccount )
              //       )
              //   );
              // },
          
                child: LogInOption()
            ),



            // SizedBox(height: 10,),
            // LogInForm(),
            // SizedBox(height: 20,),

            // SizedBox(height: 20,),
            // GestureDetector(
            //   onTap: (){
            //       //postDataLogin();
            //      // print(requestModel.toJson());
            //
            //   },
            //     child: PrimaryButton(buttonText:'Log In')),
            // SizedBox(height: 20,),
            // GestureDetector(
            //
            //   child: Text(
            //     "Or Log in with",
            //     style:subTitle.copyWith(color: kBlackColor) ,
            //   ),
            // ),


          ],
        ),
      ),
    ),
  );


  }
  bool vaidateAndSave(){
    final form=globalKey.currentState;
    if(form!.validate()){
      form.save();
      return true;
    }
    return false;
  }

  postDataLogin(

      ) async {

    Map logindata = {
      "email": emailCo.text.trim(),
        "password": passCo.text.trim()


    };
    try {
      print(logindata.toString());
      var response1;

      http.Response response = await http.post(
        Uri.parse(
            "https://x-fit-backend-graduation-project-production.up.railway.app/api/v1/user/login"),
        headers: {
          "Content-Type" : "application/json",
          "Accept" : "application/json",
        },
        body: jsonEncode(logindata),
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


 Future<http.Response?> getData() async {
    //Uri.parse(  "https://x-fit-backend-graduation-project.vercel.app");
    try{
      http.Response response = await http.get(
        Uri.parse("https://x-fit-backend-graduation-project.onrender.com/api/v1/googleUser/auth/google"),
          headers: {
          "Content-Type" : "application/json",
          "Accept" : "application/json",
            "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept"
        },
      );
      // if(response.statusCode==200) {
        print(response.body.toString());
        var a=jsonDecode(response.body);
         print(a);
      // }
      //return null;
    }
    catch(e){
      print(e);
    }
    return null;
    // Autogenerated autogenerated=Autogenerated.fromJson(jsonDecode(response.body));

  }


}


class GoogleSignInApi{

  static final _googlSignIn =GoogleSignIn();
  static Future <GoogleSignInAccount?>login()=>_googlSignIn.signIn();
}
///}

class SuccessLogin extends StatelessWidget{
  final GoogleSignInAccount user;

 const SuccessLogin ({super.key,required, required this.user });

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Sucess Login"),
    ),
    body: Center(
      child: Column(
        children: [
          Text("name"+user.displayName!),
          SizedBox(height: 16,),
          Text("email"+user.email)
        ],
      ),
    ),
  );
  }

}
 onButtonTapped(BuildContext context) async {
   await Future.delayed(const Duration(seconds: 1));


   if (!context.mounted) return;
 else {
     var g = await GoogleSignInApi.login();
       print(g?.displayName);
     print(g?.email);
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g!.displayName!),));
       if(g!=null) {
         Navigator.push(
             context,
             MaterialPageRoute(builder: (context) =>
             //   ForgotPasswordScreen()
             SuccessLogin(user: g,)
             ));
       }
   }

}
