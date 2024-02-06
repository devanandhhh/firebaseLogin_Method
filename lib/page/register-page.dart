import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mitch_koko_authentication/components/my_button.dart';
import 'package:mitch_koko_authentication/components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key,required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
//text editing controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController=TextEditingController();

// Sign User Up  method
  void siginUserUp() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    // try creating the user
    try {
      //check if password is correct or not
      if(passwordController.text==confirmPasswordController.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      }else{
        //show the error message
        errorMessage(context,'passwords dont match');
      }
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
                    'Lets Create a Account for Youh!',
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
                   MyTextfield(
                    controller: confirmPasswordController,
                    hinttext: 'Confirm Password',
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  MyButton(onTap: siginUserUp,text: 'Sign Up',),
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
                        'Already have an account ?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Login now',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
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
