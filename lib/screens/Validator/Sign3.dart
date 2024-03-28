import 'dart:convert';

import 'package:drop_down_list/drop_down_list.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xfit/screens/PrimaryButton.dart';
import 'package:xfit/screens/Validator/ThirdParty.dart';
import 'package:xfit/screens/Validator/Validator.dart';
import 'package:xfit/screens/Validator/custom%20dropdownlist.dart';
import 'package:xfit/screens/dropdown2.dart';
import 'package:xfit/screens/dropdownlist.dart';
import 'package:xfit/screens/signup.dart';
import 'package:xfit/screens/theme.dart';


class Sign3 extends StatefulWidget {
  const Sign3({super.key});
  @override
  State<Sign3> createState() => _Sign3State();
}

class _Sign3State extends State<Sign3> {

  TextEditingController weight=TextEditingController();
  TextEditingController height=TextEditingController();
  TextEditingController age=TextEditingController();
  TextEditingController bodyFatPercentage=TextEditingController();
 TextEditingController muscleMass=TextEditingController();
 TextEditingController stressLevels=TextEditingController();
  TextEditingController name=TextEditingController();
 // TextEditingController email=TextEditingController();
  TextEditingController phone=TextEditingController();
 // TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(

        child: Column(

          children: [
            const SizedBox(height: 70,),
            buildPadding("Weight",TextInputType.number,weight),
            buildPadding("Height",TextInputType.number,height),
            buildPadding("Age",TextInputType.number,age),
            buildPadding("bodyFatPercentage",TextInputType.number,bodyFatPercentage),
            buildPadding("muscleMass",TextInputType.number,muscleMass),
          //  buildPadding("workoutDurationPreference",TextInputType.number),
            buildPadding("stressLevels",TextInputType.number,stressLevels),
            ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(10)
              ),
              onPressed: (){
//                addPosts();
           //   getData();
               postData() ;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>SignUpScreen(),
                    )
                );
              },
              child: Text("Finish",),
            )

          ],


        ),
      ),
    );
  }
  getData() async {
    //Uri.parse(  "https://x-fit-backend-graduation-project.vercel.app");
    final response = await http.get(Uri.parse("https://x-fit-backend-graduation-project.vercel.app/api/v1/user/register"));
    print(response.body);
    Autogenerated autogenerated=Autogenerated.fromJson(jsonDecode(response.body));
  }
}


 postData(
     //String? name,
// String? email,
// Authentication? authentication,
// String? gender,
// int? age,
// int? weight,
// int? height,
// String? goal,
// String? experience,
// int? bodyFatPercentage,
// int? muscleMass,
// String? workoutDurationPreference,
// String? workoutFrequencyPreference,
// String? preferredExerciseTypes,
// String? trainingEnvironmentPreference,
// String? accessToEquipment,
// String? motivationLevel,
// int? stressLevels
     ) async {

  try{

    TextEditingController weight=TextEditingController();
    TextEditingController height=TextEditingController();
    TextEditingController age=TextEditingController();
    TextEditingController bodyFatPercentage=TextEditingController();
    TextEditingController muscleMass=TextEditingController();
    TextEditingController stressLevels=TextEditingController();
    TextEditingController name=TextEditingController();
    TextEditingController email=TextEditingController();
    TextEditingController phone=TextEditingController();
    TextEditingController password=TextEditingController();
    TextEditingController ge=TextEditingController();
    TextEditingController go=TextEditingController();
    TextEditingController le=TextEditingController();
    TextEditingController ex=TextEditingController();
    TextEditingController ml=TextEditingController();
    TextEditingController wdp=TextEditingController();
    TextEditingController wfp=TextEditingController();
    TextEditingController pet=TextEditingController();
    TextEditingController tep=TextEditingController();
    TextEditingController ate=TextEditingController();

    Map data={
      "name": name.text,
      "email" : email.text.trim(),
      "phone" :phone.text,
      "password":password.text,
      // "gender": ge.text,
      // "goal" : go.text,
      // "level": le.text,
      // "experience" : ex.text,
      // "motivationLevel" : ml.text,
      // "accessToEquipment": ate.text,
      // "trainingEnvironmentPreference":  tep.text,
      // "preferredExerciseTypes": pet.text,
      // "workoutFrequencyPreference": wfp.text,
      // "workoutDurationPreference": wdp.text,
      "weight": weight.text,
      "height":height.text,
      "age":age.text,
      "bodyFatPercentage":bodyFatPercentage.text,
      "muscleMass" :muscleMass.text,
      "stressLevels":stressLevels.text,

    };
  Autogenerated autogenerated ;
  var response ;
  response= await http.post(
      Uri.parse("https://x-fit-backend-graduation-project.vercel.app/api/v1/user/register"),body:{
       data
      //  Autogenerated , autogenerated=Autogenerated.fromJson(jsonDecode(response.body))
      }
  );
    var datadecode =jsonDecode(response.body);
  }
  catch(e){
    print(e);
  }

 }

// getData() async{

   //  var response = await
   //          get(
   //              Uri.parse("https://x-fit-backend-graduation-project.vercel.app"));
   // // final responsebody= jsonDecode(response.body);
   //          //loading=false;
   //
   //    Autogenerated autogenerated=Autogenerated.fromJson(jsonDecode(response.body));
//}

class Autogenerated {
  String? name;
  String? email;
  Authentication? authentication;
  String? gender;
  int? age;
  int? weight;
  int? height;
  String? goal;
  String? experience;
  int? bodyFatPercentage;
  int? muscleMass;
  String? workoutDurationPreference;
  String? workoutFrequencyPreference;
  String? preferredExerciseTypes;
  String? trainingEnvironmentPreference;
  String? accessToEquipment;
  String? motivationLevel;
  int? stressLevels;

  Autogenerated(
      {this.name,
        this.email,
        this.authentication,
        this.gender,
        this.age,
        this.weight,
        this.height,
        this.goal,
        this.experience,
        this.bodyFatPercentage,
        this.muscleMass,
        this.workoutDurationPreference,
        this.workoutFrequencyPreference,
        this.preferredExerciseTypes,
        this.trainingEnvironmentPreference,
        this.accessToEquipment,
        this.motivationLevel,
        this.stressLevels
      }
      );

  Autogenerated.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    authentication = json['authentication'] != null
        ? new Authentication.fromJson(json['authentication'])
        : null;
    gender = json['gender'];
    age = json['age'];
    weight = json['weight'];
    height = json['height'];
    goal = json['goal'];
    experience = json['experience'];
    bodyFatPercentage = json['bodyFatPercentage'];
    muscleMass = json['muscleMass'];
    workoutDurationPreference = json['workoutDurationPreference'];
    workoutFrequencyPreference = json['workoutFrequencyPreference'];
    preferredExerciseTypes = json['preferredExerciseTypes'];
    trainingEnvironmentPreference = json['trainingEnvironmentPreference'];
    accessToEquipment = json['accessToEquipment'];
    motivationLevel = json['motivationLevel'];
    stressLevels = json['stressLevels'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;

    if (this.authentication != null) {
      data['authentication'] = this.authentication!.toJson();
    }
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['goal'] = this.goal;
    data['experience'] = this.experience;
    data['bodyFatPercentage'] = this.bodyFatPercentage;
    data['muscleMass'] = this.muscleMass;
    data['workoutDurationPreference'] = this.workoutDurationPreference;
    data['workoutFrequencyPreference'] = this.workoutFrequencyPreference;
    data['preferredExerciseTypes'] = this.preferredExerciseTypes;
    data['trainingEnvironmentPreference'] = this.trainingEnvironmentPreference;
    data['accessToEquipment'] = this.accessToEquipment;
    data['motivationLevel'] = this.motivationLevel;
    data['stressLevels'] = this.stressLevels;
    return data;
  }
}

class Authentication {
  String? password;

  Authentication({this.password});

  Authentication.fromJson(Map<String, dynamic> json) {
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    return data;
  }
}
//
// addPosts() async{
//   // var response = await get(Uri.parse("https://x-fit-backend-graduation-project.vercel.app"),
//   // //     body: {
//   // //   "name":'ahmed',
//   // //   "age":"1",
//   // //   "weight":"50"
//   // // }
//   // );
//   List responsebody=json.decode(response.body);
//   return responsebody ;
// }

Padding buildPadding(label,keyboardType,controller) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: kTextFieldColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ) ,
        focusedBorder: const OutlineInputBorder(
            borderSide:BorderSide(color: kPrimaryColor)

        )  ,




      ),
    ),
  );
}