
import 'package:flutter/material.dart';
import 'package:xfit/screens/provider/RegistrationData.dart';
//import 'package:xfit/screens/new/SecondRegistrationScreen.dart';
import 'package:xfit/screens/provider/SecondRegistrationScreen.dart';

class RegistrationScreen1 extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen1> {
  final _formKey = GlobalKey<FormState>();
  RegistrationData registrationData = RegistrationData();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration - Step 1'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value!.isEmpty || !value.contains('@')) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              validator: (value) {
                if (value!.isEmpty || value.length < 6) {
                  return 'Password must be at least 6 characters long';
                }
                return null;
              },
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
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        SecondRegistrationScreen1()
                     //   ThirdRegistrationScreen()
                    ),
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
}