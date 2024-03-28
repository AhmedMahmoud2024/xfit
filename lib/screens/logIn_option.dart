import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';
class LogInOption extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        // BuildButton(
        //   iconImage: Image(
        //     height: 20,
        //     width: 20,
        //     image: AssetImage("images/facebook.png"),),
        //   textButton: "Facebook",
        // ),

        BuildButton(iconImage: Image(
            height: 20,
            width: 20,
            image: AssetImage("images/google.png")),
          textButton: "google",
        )
      ],
    );


  }

}
class BuildButton  extends StatelessWidget{
  final String textButton;
  final Image iconImage ;
  BuildButton({super.key, required this.iconImage, required this.textButton});
  @override
  Widget build(BuildContext context) {
    var mediaQuery =MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.height * 0.06,
      width: mediaQuery.width * 0.36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color:Colors.grey
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
  //            onTap: signInWithGoogle,
              child: iconImage),
          SizedBox(width: 5,),
          GestureDetector(
//              onTap: signInWithGoogle,
              child: Text(textButton))
        ],
      ),
    );
  }

}
//
// Future<UserCredential> signInWithGoogle() async {
//   // Trigger the authentication flow
//   final GoogleSignInAccount? googleUser = await GoogleSignIn(clientId:
//   "").signIn();
//
//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
//
//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth?.accessToken,
//     idToken: googleAuth?.idToken,
//   );
//
//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }
