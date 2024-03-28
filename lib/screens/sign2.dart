import 'package:drop_down_list/drop_down_list.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:xfit/screens/PrimaryButton.dart';
import 'package:xfit/screens/Validator/Sign3.dart';
import 'package:xfit/screens/Validator/Validator.dart';
import 'package:xfit/screens/Validator/custom%20dropdownlist.dart';
import 'package:xfit/screens/dropdown2.dart';
import 'package:xfit/screens/dropdownlist.dart';
import 'package:xfit/screens/signup.dart';
import 'package:xfit/screens/theme.dart';


class Sign2 extends StatefulWidget {
  const Sign2( {super.key});

  @override
  State<Sign2> createState() => _Sign2State();
}

class _Sign2State extends State<Sign2> {
 // final <DropdownButton> drp=GlobalKey(Drop);


  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(

            children: [
          const SizedBox(height: 10,),

        //
        // //
        // // buildPadding("Weight"),
        // //       // buildPadding("Height"),
        // //       // buildPadding("Age"),
        // //       // buildPadding("Date of Birth"),
             Container(
               width: 500,
                 height: 200,
                 child: DropDownList()),
              Container(
                  width: 500,
                  height: 70,
                  child: DropDown2()
              ),
           //   SizedBox(height: 20,),
        //
        //       Container(
        //           width: 370,
        //           height: 55,
        //           child: buildTextFormField(
        //             "Enter Your Goal",
        //                 (value){
        //               if(   value!.isEmpty  ){
        //                 return "please Enter The Field" ;
        //               } return null;
        //
        //             },
        //             TextInputType.text
        //           )
        //       ),
        //       SizedBox(height: 20,),
        //       Container(
        //           width: 370,
        //           height: 55,
        //           child: buildTextFormField(
        //               "Enter Your Weight",
        //                   (value){
        //                 if(   value!.isEmpty  ){
        //                   return "please Enter The Field" ;
        //                 } return null;
        //
        //               },
        //               TextInputType.number
        //           )
        //       ),
        //
        //       SizedBox(height: 20,),
        //       Container(
        //         width: 370,
        //         height: 55,
        //           child: buildTextFormField(
        //               "Enter Your Height",
        //                 (value){
        //               if(   value!.isEmpty  ){
        //                 return "please Enter The Field" ;
        //               } return null;
        //
        //             },
        //               TextInputType.number
        //           ),
        //
        //       ),
        //
        //       SizedBox(height: 20,),
        //       Container(
        //         width: 370,
        //         height: 50,
        //         child: buildTextFormField(
        //             "Enter Your experience",
        //               (value){
        //             if(   value!.isEmpty  ){
        //               return "please Enter The Field" ;
        //             } return null;
        //
        //           },
        //             TextInputType.text
        //         ),
        //       ),
        //       SizedBox(height: 20,),
        //       Container(
        //         width: 370,
        //         height: 50,
        //         child: buildTextFormField(
        //             "Enter Your Age",
        //               (value){
        //             if(   value!.isEmpty  ){
        //               return "please Enter The Field" ;
        //             } return null;
        //
        //           },
        //             TextInputType.number
        //         ),
        //       ),
        //       SizedBox(height: 20,),
        //       Container(
        //         width: 370,
        //         height: 50,
        //         child: buildTextFormField(
        //             "Enter  bodyFatPercentage ",
        //                 (value){
        //               if(   value!.isEmpty  ){
        //                 return "please Enter The Field" ;
        //               } return null;
        //
        //             },
        //             TextInputType.number
        //         ),
        //       ),
        //       SizedBox(height: 20,),
        //       Container(
        //         width: 370,
        //         height: 50,
        //         child: buildTextFormField(
        //             "Enter  muscleMass ",
        //                 (value){
        //               if(   value!.isEmpty  ){
        //                 return "please Enter The Field" ;
        //               } return null;
        //
        //             },
        //             TextInputType.number
        //         ),
        //       ),
        //       SizedBox(height: 20,),
        //       Container(
        //         width: 370,
        //         height: 50,
        //         child: buildTextFormField(
        //             "Enter  workoutDurationPreference ",
        //                 (value){
        //               if(   value!.isEmpty  ){
        //                 return "please Enter The Field" ;
        //               } return null;
        //
        //             },
        //             TextInputType.text
        //         ),
        //       ),
        //       SizedBox(height: 20,),
        //       Container(
        //         width: 370,
        //         height: 50,
        //         child: buildTextFormField(
        //             "Enter  workoutFrequencyPreference ",
        //                 (value){
        //               if(   value!.isEmpty  ){
        //                 return "please Enter The Field" ;
        //               } return null;
        //
        //             },
        //             TextInputType.text
        //         ),
        //       ),
        //       SizedBox(height: 20,),
        //       Container(
        //         width: 370,
        //         height: 50,
        //         child: buildTextFormField(
        //             "Enter  preferredExerciseTypes ",
        //                 (value){
        //               if(   value!.isEmpty  ){
        //                 return "please Enter The Field" ;
        //               } return null;
        //
        //             },
        //             TextInputType.text
        //         ),
        //       ),
        //       SizedBox(height: 20,),
        //       Container(
        //         width: 370,
        //         height: 50,
        //         child: buildTextFormField(
        //             "Enter  trainingEnvironmentPreference ",
        //                 (value){
        //               if(   value!.isEmpty  ){
        //                 return "please Enter The Field" ;
        //               } return null;
        //
        //             },
        //             TextInputType.text
        //         ),
        //       ),
        //       SizedBox(height: 20,),
        //       Container(
        //         width: 370,
        //         height: 50,
        //         child: buildTextFormField(
        //             "Enter  accessToEquipment ",
        //                 (value){
        //               if(   value!.isEmpty  ){
        //                 return "please Enter The Field" ;
        //               } return null;
        //
        //             },
        //             TextInputType.text
        //         ),
        //       ),
        //       SizedBox(height: 20,),
        //       Container(
        //         width: 370,
        //         height: 50,
        //         child: buildTextFormField(
        //             "Enter  motivationLevel ",
        //                 (value){
        //               if(   value!.isEmpty  ){
        //                 return "please Enter The Field" ;
        //               } return null;
        //
        //             },
        //             TextInputType.text
        //         ),
        //       ),
        //       SizedBox(height: 20,),
        //       Container(
        //         width: 370,
        //         height: 50,
        //         child: buildTextFormField(
        //             "Enter  stressLevels ",
        //                 (value){
        //               if(   value!.isEmpty  ){
        //                 return "please Enter The Field" ;
        //               } return null;
        //
        //             },
        //             TextInputType.number
        //         ),
        //       ),
            //  SizedBox(height: 30,),
             buildPadding1(goal,  const Text(
               'Select Your goal',
               style: TextStyle(fontSize: 14),
             ),
               TextEditingController(text: '8')
             ),
         //     SizedBox(height: 20,),
              buildPadding1(experience  ,const Text(
                'Select Your experience',
                style: TextStyle(fontSize: 14),
              )
                  ,
                  TextEditingController(text: '7')
              ),
          //    SizedBox(height: 20,),
              buildPadding1(experience  ,const Text(
                'Select Your motivationLevel',
                style: TextStyle(fontSize: 14),
              )
                  ,
                  TextEditingController(text: '6')
              ),
              buildPadding1(experience  ,const Text(
                'Select Your accessToEquipment',
                style: TextStyle(fontSize: 14),
              )
                  ,
                  TextEditingController(text: '5')
              ),
              buildPadding1(experience  ,const Text(
                'Select Your trainingEnvironmentP',
                style: TextStyle(fontSize: 14),
              ),

                  TextEditingController(text: '4')
              ),
              buildPadding1(experience  ,const Text(
                'Select Your preferredExerciseTypes',
                style: TextStyle(fontSize: 14),
              )
                  ,
                  TextEditingController(text: '3')
              ),
              buildPadding1(experience  ,const Text(
                'Select Your workoutFrequencyPreference',
                style: TextStyle(fontSize: 14),
              )

                  ,
                  TextEditingController(text: '2')
              ),
              buildPadding1(exper  ,const Text(
                'Select Your workoutDurationPreference',
                style: TextStyle(fontSize: 14),
              )
                  ,
                  TextEditingController(text: '1')
              ),
             //  Row(
             //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
             //   children: [
             //       Text("your level"),
             // SizedBox(width: 5,),
             //      SizedBox(
             //          width: 550,
             //          height: 70,
             //          child: buildDropdownButton(Items, Text(
             //            'Select Your Level',
             //            style: TextStyle(fontSize: 14),
             //          ))
             //      ),
             //    ],
             //  ),
              SizedBox(height: 20,),

         //  CustomDropList(),
           //   buildDropdownButton(),
              ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(10)
              ),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)=>const Sign3(),
                      )
                  );
                },
                child: Text("Continue",),
              )

            ],




              ),
      ),
    );




  }

 final List<String> Items = [
    '  Beginner',
    '  Mid',
    'Sennior',
  ];
  final List<String> goal = [
    'Weight Loss',
    'Weight Loss',
    'Weight Loss',
    //'select level'
  ];


  String dropdownValue= "Weight Loss";
  Padding buildDropdownButton(List,hint) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 170),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButtonFormField<String>(
            isExpanded: false,
            decoration: InputDecoration(
              // Add Horizontal padding using menuItemStyleData.padding so it matches
              // the menu padding when button's width is not specified.
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              // Add more decoration..
            ),
            validator: (value) {
              if (value == null) {
                return 'Please select level.';
              }
              return null;
            },
            hint: hint,
            onChanged: (String? newValue){
              setState(() {
                dropdownValue=newValue!;
              });

            },
            value: dropdownValue,
            items: Items.map<DropdownMenuItem<String>>(
                  (String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),

          ),
        ],
      ),
    );
  }


  TextFormField buildTextFormField(hint,validator,keyBoardType) {
    return TextFormField(
                    validator: (value){
  if(   value!.isEmpty  ){
  return "please Enter The Field" ;
  } return null;

  },
      keyboardType: keyBoardType,
     // autovalidateMode: AutovalidateMode.always,
              decoration: InputDecoration(
                contentPadding:  EdgeInsets.all(16),
                hintText: hint,
                hintStyle:  TextStyle(fontSize: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            );
  }

  Padding buildPadding(label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: kTextFieldColor),
            border:const OutlineInputBorder() ,
            focusedBorder: const OutlineInputBorder(
                borderSide:BorderSide(color: kPrimaryColor)
            )  ,




        ),
      ),
    );
  }
}

final List<String> goal1 = [
  'Weight L',
  'Weight Lo',
  'Sennior',
  'select level'
];
final List<String> experience = [
  'Weight Ls',
  'Weight Lo',
  'Sennior1',
  'select level'
];

final List<int> exper = [
  1,
  2,
  3,
  4
];
String dropdownValue= "Weight Loss";
Padding buildPadding1(List,hint,controller) {
  final formKeyS2 = GlobalKey<FormState>();
  final Key = GlobalKey<_Sign2State>();

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 25),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // TextFormField(
        //   decoration: InputDecoration(
        //     contentPadding:  EdgeInsets.all(16),
        //     hintText: 'Enter Your Level.',
        //     hintStyle: const TextStyle(fontSize: 14),
        //     border: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(15),
        //     ),
        //   ),
        // ),
        const SizedBox(height: 10),
        DropdownButtonFormField2<String>(
          key: formKeyS2,
          dropdownButtonKey: Key,
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
          hint:
          hint,
          // const Text(
          //   'Select Your goal',
          //   style: TextStyle(fontSize: 14),
          // ),
          items: goal1
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
            dropdownValue = value.toString();
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
        ),
        // const SizedBox(height: 30),
        // TextButton(
        //   onPressed: () {
        //     if (_formKey.currentState!.validate()) {
        //       _formKey.currentState!.save();
        //     }
        //   },
        //   child: const Text('Submit Button'),
        // ),
        //
      ],
    ),
  );
}