import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //forground state
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null){
        print(message.notification!.title);
        print(message.notification!.body);
      }
    });

    //app is opened but not terminated state
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message.notification != null){
        print(message.notification!.title);
        print(message.notification!.body);
        print(message.data['path']);
        Navigator.pushNamed(context, message.data['path']);
      }
    });
    
    //when the app is terminated
    FirebaseMessaging.instance.getInitialMessage().then((message) {
    if (message != null){
      print(message.notification!.title);
      print(message.notification!.body);
      print(message.data['path']);
  }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Home Screen 2"),
      ),
    );
  }
}
