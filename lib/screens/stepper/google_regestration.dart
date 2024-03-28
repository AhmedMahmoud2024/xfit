import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xfit/screens/Validator/Sign3.dart';
import 'package:xfit/screens/login.dart';
import 'package:xfit/screens/stepper/SignUp.dart';
import 'package:xfit/screens/theme.dart';
import 'package:http/http.dart' as http;

class GoogleRegesStepper extends StatefulWidget {
   const GoogleRegesStepper({super.key});

  @override
  State<GoogleRegesStepper> createState() => _GoogleRegesStepperState();
}

class _GoogleRegesStepperState extends State<GoogleRegesStepper> {
  int currentStep = 0;
  final _formKey0 = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController genderC = TextEditingController();
  final TextEditingController ageC = TextEditingController();
  final TextEditingController weightC = TextEditingController();
  final TextEditingController heightC = TextEditingController();
  final TextEditingController goalC = TextEditingController();
  final TextEditingController experienceC = TextEditingController();
  final TextEditingController bodyFatPercentageC = TextEditingController();
  final TextEditingController muscleMassC = TextEditingController();
  final TextEditingController preferredExerciseTypesC = TextEditingController();
  final TextEditingController workoutFrequencyPreferenceC = TextEditingController();
  final TextEditingController workoutDurationPreferenceC = TextEditingController();
  final TextEditingController trainingEnvironmentPreferenceC = TextEditingController();
  final TextEditingController accessToEquipmentC = TextEditingController();
  final TextEditingController motivationLevelC = TextEditingController();
  final TextEditingController stressLevelsC = TextEditingController();
  // final  pref.getInstance();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Regestration"),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: currentStep,
        onStepTapped: (step) => setState(() => currentStep = step),
        onStepContinue: () async {
          final isLastStep = currentStep == getSteps().length - 1;
          if (isLastStep) {
            bool isCompleted = false;
            setState(() => isCompleted = true);
            postData2();
            print("complete");
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context)=>const LoginScreen(
            //         // emailController,
            //         // passwordController
            //       ),
            //     )
            // );
            // send data to server
          } else {
            setState(() => currentStep += 1);
          }
        },
        onStepCancel: () {
          currentStep == 0 ? null : setState(() => currentStep -= 1);
        },
      ),
    );
  }

  List<Step> getSteps() => [
    Step(
      state: currentStep > 0 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 0,
      title: const Text("First"),
      content: Column(
        children: <Widget>[
          TextFormField(
            controller: emailC,
            decoration: const InputDecoration(labelText: 'email'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: genderC,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value!.isEmpty || !value.contains('@')) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          TextFormField(
            controller: ageC,
            decoration: const InputDecoration(labelText: 'Password'),
            validator: (value) {
              if (value!.isEmpty || value.length < 6) {
                return 'Password must be at least 6 characters long';
              }
              return null;
            },
          ),
          // const SizedBox(height: 40,),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Text(
          //       "Already A member?",
          //       style: subTitle,
          //     ),
          //     const SizedBox(width: 5),
          //     GestureDetector(
          //       onTap: (){
          //         Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context)=>const LoginScreen(),
          //             )
          //         );
          //       },
          //       child: Text(
          //         "Log In",
          //         style: textButton.copyWith(
          //             decoration: TextDecoration.underline,
          //             decorationThickness: 1
          //         ),),
          //     )
          //
          //   ],
          // ),
          // TextFormField(
          //   controller: _phoneController,
          //   decoration: InputDecoration(labelText: 'Phone'),
          //   validator: (value) {
          //     if (value!.isEmpty) {
          //       return 'Please enter your phone number';
          //     }
          //     return null;
          //   },
          // ),
          // SizedBox(height: 20.0),
          // ElevatedButton(
          //   onPressed: () {
          //     if (_formKey.currentState!.validate()) {
          //       // Navigator.push(
          //       //   context,
          //       //   MaterialPageRoute(builder: (context) =>
          //       //       SecondRegistrationScreen1()
          //       //     //   ThirdRegistrationScreen()
          //       //   ),
          //       // );
          //     }
          //   },
          //   child: Text('Next'),
          // )


        ],


      ),

    ),
    Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text("Second"),
        content: Column(
          children: <Widget>[
            TextFormField(
              controller:weightC,
              decoration: const InputDecoration(labelText: 'gender'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your gender';
                }
                return null;
              },
            ),
            TextFormField(
              controller: heightC,
              decoration: const InputDecoration(labelText: 'age'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your age';
                }
                return null;
              },
            ),
            TextFormField(
              controller:goalC,
              decoration: const InputDecoration(labelText: 'weight'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your weight';
                }
                return null;
              },
            ),
            TextFormField(
              controller:experienceC,
              decoration: const InputDecoration(labelText: 'height'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your height';
                }
                return null;
              },
            ),
            TextFormField(
              controller:bodyFatPercentageC,
              decoration: const InputDecoration(labelText: 'goal'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your goal';
                }
                return null;
              },
            ),
            TextFormField(
              controller:muscleMassC,
              decoration: const InputDecoration(labelText: 'experience'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter experience';
                }
                return null;
              },
            ),
            TextFormField(
              controller:preferredExerciseTypesC,
              decoration: const InputDecoration(labelText: 'bodyFatPercentage'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your bodyFatPercentage';
                }
                return null;
              },
            ),
            TextFormField(
              controller: workoutFrequencyPreferenceC,
              decoration: const InputDecoration(labelText: 'muscleMass'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your muscleMass';
                }
                return null;
              },
            ),

            TextFormField(
              controller: workoutDurationPreferenceC,
              decoration: const InputDecoration(labelText: 'preferredExerciseTypes'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your preferredExerciseTypes';
                }
                return null;
              },
            ),

          ],
        )),
    Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: const Text("Final"),
        content: Column(
          children: <Widget>[
            TextFormField(
              controller: trainingEnvironmentPreferenceC,
              decoration: const InputDecoration(labelText: 'workoutFrequencyPreference'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your workoutFrequencyPreference';
                }
                return null;
              },
            ),
            TextFormField(
              controller: accessToEquipmentC,
              decoration: const InputDecoration(labelText: 'workoutDurationPreference'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your workoutDurationPreference';
                }
                return null;
              },
            ),
            TextFormField(
              controller: motivationLevelC,
              decoration: const InputDecoration(labelText: 'trainingEnvironmentPreference'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your trainingEnvironmentPreference';
                }
                return null;
              },
            ),
            TextFormField(
              controller: stressLevelsC,
              decoration: const InputDecoration(labelText: 'accessToEquipment'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your accessToEquipment';
                }
                return null;
              },
            ),
            // TextFormField(
            //   controller: motivationLevelCon,
            //   decoration: const InputDecoration(labelText: 'motivationLevel'),
            //   keyboardType: TextInputType.number,
            //   validator: (value) {
            //     if (value!.isEmpty) {
            //       return 'Please enter your motivationLevel';
            //     }
            //     return null;
            //   },
            // ),
            // TextFormField(
            //   controller: stressLevelsCon,
            //   decoration: const InputDecoration(labelText: 'Stress Levels'),
            //   keyboardType: TextInputType.number,
            //   validator: (value) {
            //     if (value?.isEmpty ?? false) {
            //       return 'Please enter your stress levels';
            //     }
            //     return null;
            //   },
            // ),
            const SizedBox(height: 20.0),
            //  ElevatedButton(
            //   onPressed: () {
            //  //   if (_formKey.currentState!.validate()) {
            //       // Perform registration logic
            //       // For now, just navigate back
            //       //Navigator.pop(context);
            //       postData();
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) =>
            //              LoginScreen()
            //   // MianStepper()
            //             //   RegistrationScreen1()
            //             //ThirdRegistrationScreen1()
            //           )
            //       );
            //       //)
            //  //   }
            //   },
            //   child: Text('Register'),
            // ),
          ],
        )),
  ];

  postData2() async {

    Map data2 = {
      // "email": "saadhuss300@gmail.com",
      // "id": "65c00a51411d57da08e1f487",
      // "age": 22,
      // "gender": "Male",
      // "height": 180,
      // "weight": 90,
      // "goal": "Weight Loss",
      // "experience": "Intermediate",
      // "bodyFatPercentage": 20,
      // "muscleMass": 65,
      // "workoutDurationPreference": "60 minutes",
      // "workoutFrequencyPreference": "3 times a week",
      // "preferredExerciseTypes": "Cardio, Weight Training",
      // "trainingEnvironmentPreference": "Gym",
      // "accessToEquipment": "Full Gym Equipment",
      // "motivationLevel": "High",
      // "stressLevels": 2
      "email": emailC.text.trim(),
      "id" :"kjhkh",
      "gender": genderC.text.trim(),
      "age": ageC.text.trim(),
      "weight": weightC.text.trim(),
      "height": heightC.text.trim(),
      "goal": goalC.text.trim(),
      "experience": experienceC.text.trim(),
      "bodyFatPercentage": bodyFatPercentageC.text.trim(),
      "muscleMass": muscleMassC.text.trim(),
      "preferredExerciseTypes": preferredExerciseTypesC.text.trim(),
      "workoutFrequencyPreference": workoutFrequencyPreferenceC.text.trim(),
      "workoutDurationPreference": workoutDurationPreferenceC.text.trim(),
      "trainingEnvironmentPreference": trainingEnvironmentPreferenceC.text.trim(),
      "accessToEquipment": accessToEquipmentC.text.trim(),
      "motivationLevel": motivationLevelC.text.trim(),
      "stressLevels": stressLevelsC.text.trim(),
    };
    try {
      print(data2.toString());
      var response1;

      http.Response response = await http.post(
        Uri.parse(
            "https://x-fit-backend-graduation-project-production.up.railway.app/api/v1/googleUser/completeRegister"),
        headers: {
          "Content-Type" : "application/json",
          "Accept" : "application/json",
        },
        body: jsonEncode(data2),
      );
      print(response.body.toString());
      print(response.body);

      // jsonDecode(response.body);
      //  var dataE= jsonEncode(response) as Map ;
      if (response.statusCode == 200 || response.statusCode == 201 ||
          response.statusCode == 204 ) {
        final json=jsonDecode(response.body);

        // var token= json["user"]["token"];
        // print(token);
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
}
