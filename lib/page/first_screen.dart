import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mitch_koko_authentication/components/my_button.dart';
import 'package:mitch_koko_authentication/components/my_textfield.dart';

class Firstscreen extends StatefulWidget {
  Firstscreen({super.key});

  @override
  State<Firstscreen> createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
//text editing controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

// Sign User in  method
  void siginUserIn() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    //for signin
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      //pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //Wrong Email
      //pop the loading circle
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        //show error to user
        errorMessage(context, 'Wrong Email');
      } else if (e.code == 'wrong-password') {
        // show error to user
        errorMessage(context, 'Wrong Password');
      }
    }
  }

  //wrong email message popup
  void errorMessage( BuildContext context,String text) {
    ScaffoldMessenger.of(context).showSnackBar( SnackBar( backgroundColor: Colors.red, content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Welcome back,You\'ve been Missed!',
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  //user textfield
                  MyTextfield(
                    controller: emailController,
                    hinttext: 'Email',
                    obscureText: false,
                  ),
                  //password textfield
                  SizedBox(
                    height: 25,
                  ),
                  MyTextfield(
                    controller: passwordController,
                    hinttext: 'Password',
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  MyButton(onTap: siginUserIn),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        )),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: Text(
                              'Or continue',
                              style: TextStyle(color: Colors.grey[700]),
                            )),
                        Expanded(
                            child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text(
                        'Register Now',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                  //sign in button
                ],
              ),
            ),
          ),
        ));
  }
}
