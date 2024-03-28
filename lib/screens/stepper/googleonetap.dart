

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:xfit/screens/login.dart';
import 'package:xfit/screens/stepper/googleLoggedInpage.dart';

class GoogleRegistrationScreen extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn(clientId: "41716856973-5tcttrg5gdb78t5u1k8901akghqnba8o.apps.googleusercontent.com");
  final GlobalKey<NavigatorState> _navigateKey=GlobalKey<NavigatorState>();
  Future<void> _signUpWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        // User is signed in, you can use googleSignInAccount to access user information
        print('User: ${googleSignInAccount.displayName} signed in');
        _navigateKey.currentState!.pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      } else {
        // User canceled the sign-in process
        print('User canceled sign-in');
      }
    } catch (error) {
      // An error occurred during sign-in
      print('Error signing in: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up with Google'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _signUpWithGoogle,
          child: Text('Sign up with Google'),
        ),
      ),
    );
  }
}

