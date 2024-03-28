// import 'package:flutter/foundation.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'registration_provider.dart';
// import 'registration_screens.dart';
// class RegistrationModel {
//   String name;
//   String email;
//   String password;
//   String phone;
//   List<String> fields5;
//   List<String> dropdownValues;
//
//   RegistrationModel({
//     required this.name,
//     required this.email,
//     required this.password,
//     required this.phone,
//     required this.fields5,
//     required this.dropdownValues,
//   });
// }
//
//
// class MultiPageProvider extends ChangeNotifier {
//   int _currentPage = 0;
//   RegistrationModel _registrationModel = RegistrationModel(
//     name: '',
//     email: '',
//     password: '',
//     phone: '',
//     fields5: List.filled(5, ''),
//     dropdownValues: List.filled(10, ''),
//   );
//
//   int get currentPage => _currentPage;
//   RegistrationModel get registrationModel => _registrationModel;
//
//   void nextPage() {
//     if (_currentPage < 2) {
//       _currentPage++;
//       notifyListeners();
//     }
//   }
//
//   void previousPage() {
//     if (_currentPage > 0) {
//       _currentPage--;
//       notifyListeners();
//     }
//   }
//
//   void setName(String name) {
//     _registrationModel.name = name;
//     notifyListeners();
//   }
//
//   void setEmail(String email) {
//     _registrationModel.email = email;
//     notifyListeners();
//   }
//
//   void setPassword(String password) {
//     _registrationModel.password = password;
//     notifyListeners();
//   }
//
//   void setPhone(String phone) {
//     _registrationModel.phone = phone;
//     notifyListeners();
//   }
//
//   void setField5(int index, String value) {
//     _registrationModel.fields5[index] = value;
//     notifyListeners();
//   }
//
//   void setDropdownValue(int index, String value) {
//     _registrationModel.dropdownValues[index] = value;
//     notifyListeners();
//   }
// }
// class NameEmailPasswordPhoneScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<MultiPageProvider>(context);
//     var model = provider.registrationModel;
//
//     return Scaffold(
//       appBar: AppBar(title: Text('Name, Email, Password, Phone')),
//       body: Column(
//         children: [
//           TextField(
//             onChanged: (value) => provider.setName(value),
//             decoration: InputDecoration(labelText: 'Name'),
//           ),
//           TextField(
//             onChanged: (value) => provider.setEmail(value),
//             decoration: InputDecoration(labelText: 'Email'),
//           ),
//           TextField(
//             onChanged: (value) => provider.setPassword(value),
//             decoration: InputDecoration(labelText: 'Password'),
//           ),
//           TextField(
//             onChanged: (value) => provider.setPhone(value),
//             decoration: InputDecoration(labelText: 'Phone'),
//           ),
//           ElevatedButton(
//             onPressed: () => provider.nextPage(),
//             child: Text('Next'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class Fields5Screen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<MultiPageProvider>(context);
//     var model = provider.registrationModel;
//
//     return Scaffold(
//       appBar: AppBar(title: Text('Fields5')),
//       body: Column(
//         children: [
//           for (int i = 0; i < 5; i++)
//             TextField(
//               onChanged: (value) => provider.setField5(i, value),
//               decoration: InputDecoration(labelText: 'Field ${i + 1}'),
//             ),
//           ElevatedButton(
//             onPressed: () => provider.nextPage(),
//             child: Text('Next'),
//           ),
//           ElevatedButton(
//             onPressed: () => provider.previousPage(),
//             child: Text('Back'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class DropdownButtonsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<MultiPageProvider>(context);
//     var model = provider.registrationModel;
//
//     return Scaffold(
//       appBar: AppBar(title: Text('Dropdown Buttons')),
//       body: Column(
//         children: [
//           for (int i = 0; i < 10; i++)
//             DropdownButton<String>(
//               value: model.dropdownValues[i],
//               onChanged: (value) => provider.setDropdownValue(i, value!),
//               items: [
//                 DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
//                 DropdownMenuItem(value: 'Option 2', child: Text('Option 2')),
//                 DropdownMenuItem(value: 'Option 3', child: Text('Option 3')),
//               ],
//             ),
//           ElevatedButton(
//             onPressed: () => provider.previousPage(),
//             child: Text('Back'),
//           ),
//         ],
//       ),
//     );
//   }
// }
// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => MultiPageProvider()),
//       ],
//       child: MaterialApp(
//         home: Consumer<MultiPageProvider>(
//           builder: (context, provider, child) {
//             switch (provider.currentPage) {
//               case 0:
//                 return NameEmailPasswordPhoneScreen();
//               case 1:
//                 return Fields5Screen();
//               case 2:
//                 return DropdownButtonsScreen();
//               default:
//                 return NameEmailPasswordPhoneScreen();
//             }
//           },
//         ),
//       ),
//     ),
//   );
// }