import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xfit/screens/Validator/Sign3.dart';
import 'package:xfit/screens/login.dart';
import 'package:xfit/screens/stepper/GoogleAuth.dart';
import 'package:xfit/screens/stepper/SignUp.dart';
import 'package:xfit/screens/stepper/google_regestration.dart';
import 'package:xfit/screens/stepper/googleonetap.dart';
import 'package:xfit/screens/theme.dart';
import 'package:http/http.dart' as http;

class MianStepper extends StatefulWidget {
  const MianStepper({super.key});

  @override
  State<MianStepper> createState() => _MianStepperState();
}

class _MianStepperState extends State<MianStepper> {
  int currentStep = 0;
  final _formKey0 = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController authController = TextEditingController();
  final TextEditingController genderCon = TextEditingController();
  final TextEditingController ageCon = TextEditingController();
  final TextEditingController weightCon = TextEditingController();
  final TextEditingController heightCon = TextEditingController();
  final TextEditingController goalCon = TextEditingController();
  final TextEditingController experienceCon = TextEditingController();
  final TextEditingController bodyFatPercentageCon = TextEditingController();
  final TextEditingController muscleMassCon = TextEditingController();
  final TextEditingController preferredExerciseTypesCon = TextEditingController();
  final TextEditingController workoutFrequencyPreferenceCon = TextEditingController();
  final TextEditingController workoutDurationPreferenceCon = TextEditingController();
  final TextEditingController trainingEnvironmentPreferenceCon = TextEditingController();
  final TextEditingController accessToEquipmentCon = TextEditingController();
  final TextEditingController motivationLevelCon = TextEditingController();
  final TextEditingController stressLevelsCon = TextEditingController();
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
            postData1();
            print("complete");
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=>const LoginScreen(
                      // emailController,
                      // passwordController
                  ),
                )
            );
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
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Already A member?",
                      style: subTitle,
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context)=>const LoginScreen(),
                            )
                        );
                      },
                      child: Text(
                        "Log In",
                        style: textButton.copyWith(
                            decoration: TextDecoration.underline,
                            decorationThickness: 1
                        ),),
                    )

                  ],
                ),
                const SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Regestration with google?",
                      style: subTitle,
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context)=>
                               GoogleSignInDemo()
                                //  GoogleRegistrationScreen()
                                 // GoogleRegesStepper(),
                            )
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: textButton.copyWith(
                            decoration: TextDecoration.underline,
                            decorationThickness: 1
                        ),),
                    )

                  ],
                ),
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
                  controller:genderCon,
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
                  controller: ageCon,
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
                  controller:weightCon,
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
                  controller:heightCon,
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
                  controller:goalCon,
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
                  controller:experienceCon,
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
                  controller:bodyFatPercentageCon,
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
                  controller: muscleMassCon,
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
                  controller: preferredExerciseTypesCon,
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
                  controller: workoutFrequencyPreferenceCon,
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
                  controller: workoutDurationPreferenceCon,
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
                  controller: trainingEnvironmentPreferenceCon,
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
                  controller: accessToEquipmentCon,
                  decoration: const InputDecoration(labelText: 'accessToEquipment'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your accessToEquipment';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: motivationLevelCon,
                  decoration: const InputDecoration(labelText: 'motivationLevel'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your motivationLevel';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: stressLevelsCon,
                  decoration: const InputDecoration(labelText: 'Stress Levels'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return 'Please enter your stress levels';
                    }
                    return null;
                  },
                ),
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

  postData1() async {

    Map data = {
      "name": nameController.text.trim(),
      "email": emailController.text.trim(),
      "authentication": {
      "password":  passwordController.text.trim()
      },
      "gender": genderCon.text.trim(),
      "age": ageCon.text.trim(),
      "weight": weightCon.text.trim(),
      "height": heightCon.text.trim(),
      "goal": goalCon.text.trim(),
      "experience": experienceCon.text.trim(),
      "bodyFatPercentage": bodyFatPercentageCon.text.trim(),
      "muscleMass": muscleMassCon.text.trim(),
      "preferredExerciseTypes": preferredExerciseTypesCon.text.trim(),
      "workoutFrequencyPreference": workoutFrequencyPreferenceCon.text.trim(),
      "workoutDurationPreference": workoutDurationPreferenceCon.text.trim(),
      "trainingEnvironmentPreference": trainingEnvironmentPreferenceCon.text.trim(),
      "accessToEquipment": accessToEquipmentCon.text.trim(),
      "motivationLevel": motivationLevelCon.text.trim(),
      "stressLevels": stressLevelsCon.text.trim(),
    };
    try {
      print(data.toString());
      var response1;

      http.Response response = await http.post(
          Uri.parse(
              "https://x-fit-backend-graduation-project-production.up.railway.app/api/v1/user/register"),
          headers: {
            "Content-Type" : "application/json",
            "Accept" : "application/json",
          },
          body: jsonEncode(data),
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
}

