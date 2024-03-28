
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:xfit/screens/stepper/google_regestration.dart';
class GoogleSignInDemo extends StatefulWidget {
  @override
  State createState() => SignInDemoState();
}

class SignInDemoState extends State<GoogleSignInDemo> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  GoogleSignInAccount? _currentUser;

  _handleSignIn(BuildContext context) async {
    try {
      await _googleSignIn.signIn();
      _currentUser = _googleSignIn.currentUser;
      if (kDebugMode) {
        print("Signed in successfully as ${_currentUser!.displayName}");
      }
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => SignGoogleScreen(user: _currentUser),
        ),
      );
    } catch (error) {
      print("Error signing in: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Sign-In Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _handleSignIn(context),
          child: Text('Sign in with Google'),
        ),
      ),
    );
  }
}

class SignGoogleScreen extends StatelessWidget {
  final GoogleSignInAccount? user;

  SignGoogleScreen({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome, ${user!.displayName}!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => GoogleRegesStepper(),
                  ),
                );
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}