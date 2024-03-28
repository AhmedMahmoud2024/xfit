import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
//import 'package:xfit/AppTextField.dart';
import 'package:flutter/material.dart';

class D extends StatefulWidget{
  const D ({super.key});

  @override
  State<D> createState() => _D();
}

class _D extends State<D> {
  final List<String> levelItems = [
    'Beginner',
    'Mid',
    'Sennior'
  ];


  String? selectedValue;

  final _formKey = GlobalKey<FormState>();

  GlobalKey<ScaffoldState> scafoldkey=GlobalKey();
  TextEditingController country =TextEditingController();
  TextEditingController age =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text(" Complete The Regestration"),),
      body:
      Form(
        key: _formKey,
        child: buildPadding(),
      ),
      /*
        ListView(children: [
          AppTextField(
            datalist: [
              SelectedListItem(name: "Egypt"),
              SelectedListItem(name: "Eraq"),
              SelectedListItem(name: "KSA"),
            ],
            textEditingController: country,
            title: "Select Country",
            hint: "Country",
            isCitySelected: true,
          ), //////////
          AppTextField(
            datalist: [
              SelectedListItem(name: "10"),
              SelectedListItem(name: "20"),
              SelectedListItem(name: "30"),
            ],
            textEditingController: age
            ,
            title: "Select Age",
            hint: "Age",
            isCitySelected: true,
          ),

        ]
        )
        */
    );
  }

  Padding buildPadding() {
    return Padding(
        padding:  EdgeInsets.symmetric(horizontal: 25),
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
              hint: const Text(
                'Select Your Level',
                style: TextStyle(fontSize: 14),
              ),
              items: levelItems
                  .map((item) => DropdownMenuItem<String>(
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
                selectedValue = value.toString();
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
  }}