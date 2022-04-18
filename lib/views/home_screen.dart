import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mufirebase/views/sign_in.dart';

class HomeScreen extends StatelessWidget {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }
  User user;
  HomeScreen(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Home Screen",style: TextStyle(fontSize: 40),),
          ),
          ElevatedButton(onPressed: ()async{
            _signOut();
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
          }, child: Text("Sign Out")),
          Text(user.email.toString())
        ],
      ),
    );
  }
}
