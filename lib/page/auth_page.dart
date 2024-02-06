import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mitch_koko_authentication/page/first_screen.dart';
import 'package:mitch_koko_authentication/page/home_page.dart';

class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user login
if(snapshot.hasData){
  return Homepage();
}
          //user not login 
else{
  return Firstscreen() ;
}

        },
      ),
    );
  }
}