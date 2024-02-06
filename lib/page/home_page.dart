import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mitch_koko_authentication/components/my_button.dart';
import 'package:mitch_koko_authentication/components/my_textfield.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final user = FirebaseAuth.instance.currentUser;

  signUserOut() async {
    FirebaseAuth.instance.signOut();
  }
  final tournamentNameController=TextEditingController();
  final tournamentPlaceController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'DashBoard',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: signUserOut,
              color: Colors.white,
              icon: const Icon(Icons.logout),
            )
          ],
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top:15.0),
            child: Column(
              children: [
                MyTextfield(controller:tournamentNameController , hinttext: 'Tournament Name', obscureText: false),
                SizedBox(height: 10,),
                MyTextfield(controller: tournamentPlaceController, hinttext:'Tournament Place' , obscureText: false),
                SizedBox(height:  10,),
                MyButton(onTap: (){}, text: 'Add Tournament') 
              ],
            ),
          ),
        )
        // Center(child: Text('LOGGED IN AS : '+user!.email!,)),
        );
  }
}
