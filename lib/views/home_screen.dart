import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mufirebase/views/sign_in.dart';

class HomeScreen extends StatefulWidget {
  User user;
  HomeScreen(this.user);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }


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
          Text(widget.user.email.toString())
        ],
      ),
    );
  }
}
