

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoggedInPage extends StatelessWidget {

 final  GoogleSignInAccount? googleSignInAccount;

 const LoggedInPage({
    Key? key,
    required this.googleSignInAccount,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: const Text("Logged In"),
          centerTitle: true,
          // actions: [
          //   TextButton(onPressed: onPressed, child: Text("LogOut"))
          // ],
        ),
        body: Container(
          alignment: Alignment.center,
          color: Colors.blueGrey.shade900,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'profile',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 32,),
              Text(
                'Name${googleSignInAccount!.displayName}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24
                ),
              ),
              const SizedBox(width: 1,),
              Text(
                'Email${googleSignInAccount?.email}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24
                ),

              )
            ],
          ),
        ),

      );

}

