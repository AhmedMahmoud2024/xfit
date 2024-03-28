  import 'package:flutter/material.dart';

  class ThirdRegistrationScreen2 extends StatefulWidget {
  const ThirdRegistrationScreen2({super.key});

  @override
  _ThirdRegistrationScreenState createState() => _ThirdRegistrationScreenState();
}

class _ThirdRegistrationScreenState extends State<ThirdRegistrationScreen2> {
  final _formKey = GlobalKey<FormState>();
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
                  Navigator.pop(context);
                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:xfit/screens/provider/RegistrationData.dart';
// import 'package:provider/provider.dart';
//  class ThirdRegistrationScreen1 extends StatelessWidget {
//    const ThirdRegistrationScreen1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var registrationData = Provider.of<RegistrationData>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Registration - Step 3'),
//       ),
//       body: Form(
//         child: ListView(
//           padding: EdgeInsets.all(16.0),
//           children: <Widget>[
//             TextFormField(
//               onChanged: (value) => registrationData.updateWeight(value),
//               decoration: InputDecoration(labelText: 'Weight'),
//             ),
//             TextFormField(
//               onChanged: (value) => registrationData.updateHeight(value),
//               decoration: InputDecoration(labelText: 'Height'),
//             ),
//             TextFormField(
//               onChanged: (value) => registrationData.updateAge(value),
//               decoration: InputDecoration(labelText: 'Age'),
//             ),
//             TextFormField(
//               onChanged: (value) => registrationData.updateBodyFatPercentage(value),
//               decoration: InputDecoration(labelText: 'Body Fat Percentage'),
//             ),
//             TextFormField(
//               onChanged: (value) => registrationData.updateMuscleMass(value),
//               decoration: InputDecoration(labelText: 'Muscle Mass'),
//             ),
//             TextFormField(
//               onChanged: (value) => registrationData.updateStressLevels(value),
//               decoration: InputDecoration(labelText: 'Stress Levels'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Submit registration data
//                 // For now, just navigate back to the first screen
//                 Navigator.popUntil(context, ModalRoute.withName('/'));
//               },
//               child: Text('Register'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
