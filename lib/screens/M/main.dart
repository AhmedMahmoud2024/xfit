// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:xfit/screens/M/RegesScreens.dart';
// import 'package:xfit/screens/M/RegistrationProvider.dart';
//
// import 'registration_provider.dart';
// import 'registration_screens.dart';
//
// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => RegistrationProvider(),
//       child: MaterialApp(
//         home: Consumer<RegistrationProvider>(
//           builder: (context, provider, child) {
//             switch (provider.currentStep) {
//               case 0:
//                 return RegistrationScreen1();
//               case 1:
//                 return RegistrationScreen2();
//               case 2:
//                 return RegistrationScreen3();
//               default:
//                 return RegistrationScreen1();
//             }
//           },
//         ),
//       ),
//     ),
//   );
// }
