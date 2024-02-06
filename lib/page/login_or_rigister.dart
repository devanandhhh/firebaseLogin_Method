import 'package:flutter/material.dart';
import 'package:mitch_koko_authentication/page/first_screen.dart';
import 'package:mitch_koko_authentication/page/register-page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // initially show login page
  bool showLoginPage=true;
  //toggle between login and register page
  void togglePages(){
    setState(() {
      showLoginPage=!showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
   if(showLoginPage){ 
    return Firstscreen(onTap: togglePages);
   }else{
    return RegisterPage(onTap:togglePages,);
   }
  }
} 