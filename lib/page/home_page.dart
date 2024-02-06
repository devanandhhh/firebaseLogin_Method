import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
   Homepage({super.key});

final user =FirebaseAuth.instance.currentUser;

  signUserOut() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Home Screen',style: TextStyle(color: Colors.white),),centerTitle: true,
        actions: [
          IconButton(
            onPressed: signUserOut,color:Colors.white,
            icon:const Icon(Icons.logout),
          )
        ],
        backgroundColor: Colors.black ,
      ),
      body: Center(child: Text('LOGGED IN AS : '+user!.email!,)),
    );
  }
}
