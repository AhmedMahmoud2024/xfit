// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// //import 'package:xfit/screens/new/SecondRegistrationScreen.dart';
// import 'package:xfit/screens/provider/SecondRegistrationScreen.dart';
// import 'package:xfit/screens/provider/RegistrationData.dart';
// import 'package:provider/provider.dart';
// class SecondRegistrationScreen1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var registrationData = Provider.of<RegistrationData>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Registration - Step 2'),
//       ),
//       body: Form(
//         child: ListView(
//           padding: EdgeInsets.all(16.0),
//           children: <Widget>[
//             DropdownButtonFormField<String>(
//               value: registrationData.gender,
//               onChanged: (value) => registrationData.updateGender(value!),
//               items: <String>['Male', 'Female', 'Other'].map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               decoration: InputDecoration(labelText: 'Gender'),
//             ),
//             DropdownButtonFormField<String>(
//               value: registrationData.fitnessLevel,
//               onChanged: (value) => registrationData.updateFitnessLevel(value!),
//               items: <String>['Beginner', 'Intermediate', 'Advanced'].map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               decoration: InputDecoration(labelText: 'Fitness Level'),
//             ),
//             // DropdownButtonFormField<String>(
//             //   value: registrationData.goal,
//             //   onChanged: (value) => registrationData.updateGoal(value!),
//             //   items: <String>['Lose Weight', 'Gain Muscle', 'Improve Health'].map((String value) {
//             //     return DropdownMenuItem<String>(
//             //       value: value,
//             //       child: Text(value),
//             //     );
//             //   }).toList(),
//             //   decoration: InputDecoration(labelText: 'Goal'),
//             // ),
//             // DropdownButtonFormField<String>(
//             //   value: registrationData.experience,
//             //   onChanged: (value) => registrationData.updateExperience(value!),
//             //   items: <String>['No Experience', 'Some Experience', 'Experienced', 'Professional'].map((String value) {
//             //     return DropdownMenuItem<String>(
//             //       value: value,
//             //       child: Text(value),
//             //     );
//             //   }).toList(),
//             //   decoration: InputDecoration(labelText: 'Experience'),
//             // ),
//             // Add DropdownButtonFormField widgets for other fields
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to next screen
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) =>
//                       ThirdRegistrationScreen()
//                   ),
//                 );
//               },
//               child: Text('Next'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'dart:js_util';

import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:xfit/screens/provider/RegistrationData.dart';


import 'package:xfit/screens/provider/SecondRegistrationScreen.dart';
import 'package:xfit/screens/provider/Third.dart';
import 'package:xfit/screens/provider/registration_screen.dart';
import 'package:xfit/screens/stepper/main.dart';


class SecondRegistrationScreen1 extends StatefulWidget {
  @override
  _SecondRegistrationScreenState createState() => _SecondRegistrationScreenState();
}

class _SecondRegistrationScreenState extends State<SecondRegistrationScreen1> {
  final _formKey = GlobalKey<FormState>();
  RegistrationData registrationData = RegistrationData();
  late String _gender;
  late String _fitnessLevel;
  late String _goal;
  late String _experience;
  late String _motivationLevel;
  late String _accessToEquipment;
  late String _trainingEnvironment;
  late String _preferredExerciseTypes;
  late String _workoutFrequencyPreference;
  late String _workoutDurationPreference;

  final List<String> gender = [
    'male',
    'female',
  ];

 late String genderdropdownValue="male";

  final List<String> motivationLevel = [
    'male',
    'female',
  ];

  String motivationLeveldropdownValue= "male";

  final List<String> accessToEquipment = [
    'male',
    'female',
  ];

  String accessToEquipmentdropdownValue= "male";


  final List<String> trainingEnvironment = [
    'male',
    'female',
  ];

  String trainingEnvironmentdropdownValue= "male";



  final List<String> preferredExerciseTypes = [
    'male',
    'female',
  ];

  String preferredExerciseTypesdropdownValue= "male";

  final List<String> workoutFrequencyPreference = [
    'male',
    'female',
  ];

  String workoutFrequencyPreferencedropdownValue= "male";

  final List<String> workoutDurationPreference = [
    'male',
    'female',
  ];

  String workoutDurationPreferencedropdownValue= "male";

  final List<String> fitnessLevel = [
    'Beginner',
    'Mid',
    'Advanced',
  ];


  String fitnessLeveldropdownValue= "Beginner";

  final List<String> goal = [
    'weight loss',
    'gain muscle',
  ];

  String goaldropdownvalue= "male";
  final List<String> experience = [
    'Beginner',
    'Mid',
    'Advanced',
  ];
  String experiencedropdownValue= "Beginner";

  final TextEditingController _w = TextEditingController();
  final TextEditingController _h = TextEditingController();
  final TextEditingController _a = TextEditingController();
  final TextEditingController _b = TextEditingController();
  final TextEditingController _m = TextEditingController();
  final TextEditingController _s = TextEditingController();
  final TextEditingController _t = TextEditingController();
  final TextEditingController _u = TextEditingController();
  final TextEditingController _v = TextEditingController();
  final TextEditingController _x = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Registration - Step 2'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[

    TextFormField(
    controller: _w,
    decoration: InputDecoration(labelText: 'Weight'),
    keyboardType: TextInputType.number,
    validator: (value) {
    if (value!.isEmpty) {
    return 'Please enter your weight';
    }
    return null;
    },
    ),
    TextFormField(
    controller: _h,
    decoration: InputDecoration(labelText: 'Height'),
    keyboardType: TextInputType.number,
    validator: (value) {
    if (value!.isEmpty) {
    return 'Please enter your height';
    }
    return null;
    },
    ),
    TextFormField(
    controller: _a,
    decoration: InputDecoration(labelText: 'Age'),
    keyboardType: TextInputType.number,
    validator: (value) {
    if (value!.isEmpty) {
    return 'Please enter your age';
    }
    return null;
    },
    ),
    TextFormField(
    controller: _b,
    decoration: InputDecoration(labelText: 'Body Fat Percentage'),
    keyboardType: TextInputType.number,
    validator: (value) {
    if (value!.isEmpty) {
    return 'Please enter your body fat percentage';
    }
    return null;
    },
    ),
    TextFormField(
    controller: _m,
    decoration: InputDecoration(labelText: 'Muscle Mass'),
    keyboardType: TextInputType.number,
    validator: (value) {
    if (value!.isEmpty) {
    return 'Please enter your muscle mass';
    }
    return null;
    },
    ),
    TextFormField(
    controller: _t,
    decoration: InputDecoration(labelText: 'Stress Levels'),
    keyboardType: TextInputType.number,
    validator: (value) {
    if (value!.isEmpty) {
    return 'Please enter your stress levels';
    }
    return null;
    },
    ),
            TextFormField(
              controller: _u,
              decoration: InputDecoration(labelText: 'Stress Levels'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your stress levels';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _v,
              decoration: InputDecoration(labelText: 'Stress Levels'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your stress levels';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _x,
              decoration: InputDecoration(labelText: 'Stress Levels'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your stress levels';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _s,
              decoration: InputDecoration(labelText: 'Stress Levels'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your stress levels';
                }
                return null;
              },
            ),
      //       buildDropdownButtonFormField2(gender,Text("gender"),genderdropdownValue),
      //       buildDropdownButtonFormField2(fitnessLevel,Text("fitnessLevel"),fitnessLeveldropdownValue),
      //       buildDropdownButtonFormField2(experience,Text("experience"),experiencedropdownValue),
      //       buildDropdownButtonFormField2(motivationLevel,Text("motivationLevel"),motivationLeveldropdownValue),
      //       buildDropdownButtonFormField2(goal,Text("goal"),goaldropdownvalue),
      //       buildDropdownButtonFormField2(preferredExerciseTypes,Text("preferredExerciseTypes"),preferredExerciseTypesdropdownValue),
      // buildDropdownButtonFormField2(trainingEnvironment,Text("trainingEnvironment"),trainingEnvironmentdropdownValue),
      //   buildDropdownButtonFormField2(workoutDurationPreference,Text("workoutDurationPreference"),workoutDurationPreferencedropdownValue),
      //   buildDropdownButtonFormField2(workoutFrequencyPreference,Text("workoutFrequencyPreference"),workoutFrequencyPreferencedropdownValue),
      //   buildDropdownButtonFormField2(accessToEquipment,Text("accessToEquipment"),accessToEquipmentdropdownValue),
           // buildDropdownButtonFormField2(experience,Text("www"),dropdownValue),
            // DropdownButtonFormField<String>(
            //   value: _gender,
            //   onChanged: (value) {
            //     setState(() {
            //       _gender = value!;
            //     });
            //   },
            //   items:experience
            //       .map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            //   decoration: InputDecoration(labelText: 'Gender'),
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return 'Please select a gender';
            //     }
            //     return null;
            //   },
            // ),
            // DropdownButtonFormField<String>(
            //   value: _fitnessLevel,
            //   onChanged: (value) {
            //     setState(() {
            //       _fitnessLevel = value!;
            //     });
            //   },
            //   items: <String>['Beginner', 'Intdiabte', 'Adnkced'].map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            //   decoration: InputDecoration(labelText: 'Fitness Level'),
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return 'Please select a fitness level';
            //     }
            //     return null;
            //   },
            // ),
            // DropdownButtonFormField<String>(
            //   value: _goal,
            //   onChanged: (value) {
            //     setState(() {
            //       _goal = value!;
            //     });
            //   },
            //   items: <String>['Lose Weight', 'Gain Muscle', 'Improve Health'].map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            //   decoration: InputDecoration(labelText: 'Fitness Level'),
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return 'Please select a fitness level';
            //     }
            //     return null;
            //   },
            // ),
            // DropdownButtonFormField<String>(
            //   value: _experience,
            //   onChanged: (value) {
            //     setState(() {
            //       _experience = value!;
            //     });
            //   },
            //   items: <String>['Begir', 'Intaste', 'Adcefgd'].map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            //   decoration: InputDecoration(labelText: 'Fitness Level'),
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return 'Please select a fitness level';
            //     }
            //     return null;
            //   },
            // ),
            // DropdownButtonFormField<String>(
            //   value: _motivationLevel,
            //   onChanged: (value) {
            //     setState(() {
            //       _motivationLevel = value!;
            //     });
            //   },
            //   items: <String>['B', 'Imm', 'Aki'].map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            //   decoration: InputDecoration(labelText: 'Fitness Level'),
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return 'Please select a fitness level';
            //     }
            //     return null;
            //   },
            // ),
            // DropdownButtonFormField<String>(
            //   value: _accessToEquipment,
            //   onChanged: (value) {
            //     setState(() {
            //       _accessToEquipment = value!;
            //     });
            //   },
            //   items: <String>['Be', 'Ivhn', 'Aayd'].map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            //   decoration: InputDecoration(labelText: 'Fitness Level'),
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return 'Please select a fitness level';
            //     }
            //     return null;
            //   },
            // ),
            // DropdownButtonFormField<String>(
            //   value: _trainingEnvironment,
            //   onChanged: (value) {
            //     setState(() {
            //       _trainingEnvironment = value!;
            //     });
            //   },
            //   items: <String>['Begin', 'Intermedi', 'Advan'].map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            //   decoration: InputDecoration(labelText: 'Fitness Level'),
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return 'Please select a fitness level';
            //     }
            //     return null;
            //   },
            // ),
            // DropdownButtonFormField<String>(
            //   value: _preferredExerciseTypes,
            //   onChanged: (value) {
            //     setState(() {
            //       _preferredExerciseTypes = value!;
            //     });
            //   },
            //   items: <String>['Beginn', 'Intermedia', 'Advanc'].map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            //   decoration: InputDecoration(labelText: 'Fitness Level'),
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return 'Please select a fitness level';
            //     }
            //     return null;
            //   },
            // ),
            // DropdownButtonFormField<String>(
            //   value: _workoutFrequencyPreference,
            //   onChanged: (value) {
            //     setState(() {
            //       _workoutFrequencyPreference = value!;
            //     });
            //   },
            //   items: <String>['Beginne', 'Intngmediat', 'Adngence'].map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            //   decoration: InputDecoration(labelText: 'Fitness Level'),
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return 'Please select a fitness level';
            //     }
            //     return null;
            //   },
            // ),
            // DropdownButtonFormField<String>(
            //   value: _workoutDurationPreference,
            //   onChanged: (value) {
            //     setState(() {
            //       _workoutDurationPreference = value!;
            //     });
            //   },
            //   items: <String>['Begi', 'Interytme', 'Adokuvan'].map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            //   decoration: InputDecoration(labelText: 'Fitness Level'),
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return 'Please select a fitness level';
            //     }
            //     return null;
            //   },
            // ),
            // Add DropdownButtonFormField widgets for the other fields
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                         ThirdRegistrationScreen2(
                        //      genderdropdownValue,fitnessLeveldropdownValue,experiencedropdownValue,motivationLeveldropdownValue,
                        //      goaldropdownvalue,preferredExerciseTypesdropdownValue,trainingEnvironmentdropdownValue
                        //      ,trainingEnvironmentdropdownValue,workoutDurationPreferencedropdownValue,workoutFrequencyPreferencedropdownValue
                        // //     ,accessToEquipmentdropdownValue
                      //   )

                         )
                        //ThirdRegistrationScreen1()
                      )
                  );
                }
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }

  DropdownButtonFormField2<String> buildDropdownButtonFormField2(
      items, hint,dropdown
      ) {
    return DropdownButtonFormField2<String>(
            isExpanded: true,
            decoration: InputDecoration(
              // Add Horizontal padding using menuItemStyleData.padding so it matches
              // the menu padding when button's width is not specified.
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              // Add more decoration..
            ),
            hint:hint,
            // const Text(
            //   'Select Your goal',
            //   style: TextStyle(fontSize: 14),
            // ),
            items:experience
                .map((item) =>
                DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
                .toList(),
            validator: (value) {
              if (value == null) {
                return 'Please select level.';
              }
              return null;
            },
            onChanged: (value) {
              //Do something when selected item is changed.
            },
            onSaved: (value) {
              dropdown = value.toString();
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.only(right: 8),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.black45,
              ),
              iconSize: 24,
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
            ),
          );
  }
}


  class ThirdRegistrationScreen2 extends StatefulWidget {
  const ThirdRegistrationScreen2(

      {super.key});

  @override
  _ThirdRegistrationScreenState createState() => _ThirdRegistrationScreenState();
  }

  class _ThirdRegistrationScreenState extends State<ThirdRegistrationScreen2> {
  final _formKey = GlobalKey<FormState>();
  RegistrationData registrationData = RegistrationData();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _bodyFatPercentageController = TextEditingController();
  final TextEditingController _muscleMassController = TextEditingController();
  final TextEditingController _stressLevelsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: Text('Registration - Step 3'),
  ),
  body: Form(
  key: _formKey,
  child: ListView(
  padding: EdgeInsets.all(16.0),
  children: <Widget>[
  TextFormField(
  controller: _weightController,
  decoration: InputDecoration(labelText: 'Weight'),
  keyboardType: TextInputType.number,
  validator: (value) {
  if (value!.isEmpty) {
  return 'Please enter your weight';
  }
  return null;
  },
  ),
  TextFormField(
  controller: _heightController,
  decoration: InputDecoration(labelText: 'Height'),
  keyboardType: TextInputType.number,
  validator: (value) {
  if (value!.isEmpty) {
  return 'Please enter your height';
  }
  return null;
  },
  ),
  TextFormField(
  controller: _ageController,
  decoration: InputDecoration(labelText: 'Age'),
  keyboardType: TextInputType.number,
  validator: (value) {
  if (value!.isEmpty) {
  return 'Please enter your age';
  }
  return null;
  },
  ),
  TextFormField(
  controller: _bodyFatPercentageController,
  decoration: InputDecoration(labelText: 'Body Fat Percentage'),
  keyboardType: TextInputType.number,
  validator: (value) {
  if (value!.isEmpty) {
  return 'Please enter your body fat percentage';
  }
  return null;
  },
  ),
  TextFormField(
  controller: _muscleMassController,
  decoration: InputDecoration(labelText: 'Muscle Mass'),
  keyboardType: TextInputType.number,
  validator: (value) {
  if (value!.isEmpty) {
  return 'Please enter your muscle mass';
  }
  return null;
  },
  ),
  TextFormField(
  controller: _stressLevelsController,
  decoration: InputDecoration(labelText: 'Stress Levels'),
  keyboardType: TextInputType.number,
  validator: (value) {
  if (value!.isEmpty) {
  return 'Please enter your stress levels';
  }
  return null;
  },
  ),
  SizedBox(height: 20.0),
  ElevatedButton(
  onPressed: () {
  if (_formKey.currentState!.validate()) {
  // Perform registration logic
  // For now, just navigate back
  //Navigator.pop(context);
    postData();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
            MianStepper()
          //   RegistrationScreen1()
          //ThirdRegistrationScreen1()
        )
    );
    //)
  }
  },
  child: Text('Register'),
  ),
  ],
  ),

  ),
  );
  }

  postData() async {

      final TextEditingController _nameController = TextEditingController();
      final TextEditingController _emailController = TextEditingController();
      final TextEditingController _passwordController = TextEditingController();
      final TextEditingController _phoneController = TextEditingController();
      final TextEditingController _weightController = TextEditingController();
      final TextEditingController _heightController = TextEditingController();
      final TextEditingController _ageController = TextEditingController();
      final TextEditingController _bodyFatPercentageController = TextEditingController();
      final TextEditingController _muscleMassController = TextEditingController();
      final TextEditingController _stressLevelsController = TextEditingController();

      final TextEditingController _w = TextEditingController();
      final TextEditingController _h = TextEditingController();
      final TextEditingController _a = TextEditingController();
      final TextEditingController _b = TextEditingController();
      final TextEditingController _m = TextEditingController();
      final TextEditingController _s = TextEditingController();
      final TextEditingController _t = TextEditingController();
      final TextEditingController _u = TextEditingController();
      final TextEditingController _v = TextEditingController();
      final TextEditingController _x = TextEditingController();
      Map data={


      } ;

    // var response1 ;
     http.Response response= await http.post(
          Uri.parse("https://x-fit-backend-graduation-project.vercel.app/api/v1/user/register"),body:{
       "name":_emailController.text,
       "email" : _emailController.text.trim(),
       "password": _phoneController.text,
       "gender": _h.text,
       "age":_ageController.text,
       "weight":_weightController.text,
       "height": _heightController.text,
       "goal" :  _w.text,
       "experience" :_b.text,
       "bodyFatPercentage" : _bodyFatPercentageController.text,
       "muscleMass" : _muscleMassController.text,
       "preferredExerciseTypes": _u.text,
       "workoutFrequencyPreference":_v.text,
       "workoutDurationPreference":_x.text,
       "trainingEnvironmentPreference":_t.text  ,
       "accessToEquipment":_s.text,
       "motivationLevel" :_m.text ,
       "stressLevels":  _stressLevelsController.text,
     },

      );
       String  autogenerated=jsonEncode(response.body);
 //    data = jsonEncode(response) as Map ;
      if (response.statusCode == 200) {
  final json=jsonDecode(response.body);

        // Registration successful
        print('Registration successful');
      } else {
        // Registration failed
        print('Registration failed');
      }

     return response.body;}


// catch(e){
//       print(e);
//     }
    // RegistrationData registrationData = RegistrationData();
    // // Send registrationData to API
    // final response = await http.post(
    //   Uri.parse("https://x-fit-backend-graduation-project.vercel.app/api/v1/user/register"),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: jsonEncode(registrationData),
    // );
    //
    // if (response.statusCode == 200) {
    //   // Registration successful
    //   print('Registration successful');
    // } else {
    //   // Registration failed
    //   print('Registration failed');
    // }
}

getData() async{

 var response = await
         get(
             Uri.parse("https://x-fit-backend-graduation-project.vercel.app"));
  final responsebody= jsonDecode(response.body);
         //loading=false;

 //  Autogenerated autogenerated=Autogenerated.fromJson(jsonDecode(response.body));
}
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
    //
    // if (this.authentication != null) {
    //   data['authentication'] = this.authentication!.toJson();
    // }
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
  // try{
  //   final TextEditingController _nameController = TextEditingController();
  //   final TextEditingController _emailController = TextEditingController();
  //   final TextEditingController _passwordController = TextEditingController();
  //   final TextEditingController _phoneController = TextEditingController();
  //   final TextEditingController _weightController = TextEditingController();
  //   final TextEditingController _heightController = TextEditingController();
  //   final TextEditingController _ageController = TextEditingController();
  //   final TextEditingController _bodyFatPercentageController = TextEditingController();
  //   final TextEditingController _muscleMassController = TextEditingController();
  //   final TextEditingController _stressLevelsController = TextEditingController();
  //
  //
  //
  //   Map data={
  //
  //      "name":_nameController.text,
  //     "email" : _emailController.text.trim(),
  //     "phone" :_passwordController.text,
  //     "password":_phoneController.text,
  //     // "gender": RegistrationData.text,
  //     // "goal" : go.text,
  //     // "level": le.text,
  //     // "experience" : ex.text,
  //     // "motivationLevel" : ml.text,
  //     // "accessToEquipment": ate.text,
  //     // "trainingEnvironmentPreference":  tep.text,
  //     // "preferredExerciseTypes": pet.text,
  //     // "workoutFrequencyPreference": wfp.text,
  //     // "workoutDurationPreference": wdp.text,
  //      "weight": _weightController.text,
  //     "height":_heightController.text,
  //      "age":_ageController.text,
  //     "bodyFatPercentage":_bodyFatPercentageController.text,
  //      "muscleMass" :_muscleMassController.text,
  //     "stressLevels":_stressLevelsController.text,
  //
  //   } as Map;
  //
  //   var response ;
  //   response= await http.post(
  //       Uri.parse("https://x-fit-backend-graduation-project.vercel.app/api/v1/user/register"),body:{
  //     data
  //   }
  //   );
  //   var datadecode =jsonDecode(response.body);
  //   return datadecode;
// catch(e){
  //   print(e);
  // }

  //}
  // catch(e){
  //   print(e);
  // }


//}
