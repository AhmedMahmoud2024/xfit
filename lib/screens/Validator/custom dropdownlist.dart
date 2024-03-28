
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropList extends StatefulWidget{
  const CustomDropList({super.key});

  @override
  State<CustomDropList> createState() => _CustomDropListState();
}

class _CustomDropListState extends State<CustomDropList> {
  final formKeyc = GlobalKey<FormState>();

   List<String> Items = [
    'Beginner',
    'Mid',
    'Sennior'
  ];
  String dropdownValue='select level';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildDropdownButton(
          Items, const Text(
          'Select Your Level',
          style: TextStyle(fontSize: 14),
        ),
        ),
    ));
  }

  Padding buildDropdownButton(List,hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButtonFormField<String>(
        key: formKeyc,
            validator: (value) {
              if (value == null) {
                return 'Please select level.';
              }
              return null;
            },
            decoration: InputDecoration(
              // Add Horizontal padding using menuItemStyleData.padding so it matches
              // the menu padding when button's width is not specified.
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              // Add more decoration..
            ),
            //validator: ,
            isExpanded: true,
            hint:hint,
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
}