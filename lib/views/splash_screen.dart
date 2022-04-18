// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:mufirebase/views/home_screen.dart';
// import 'package:mufirebase/views/sign_in.dart';
// import 'package:mufirebase/views/sign_up.dart';
//
// class SplashScreen extends StatelessWidget {
//   final box = GetStorage();
//   chooseScreen(context)async{
//     var userId = await box.read('id');
//     if (userId!=null){
//       Navigator.push(context, CupertinoPageRoute(builder: (context)=>HomeScreen()));
//     }else {
//       Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Timer(Duration(seconds: 2), ()=>chooseScreen(context));
//     return Scaffold(
//       body: Center(
//         child: CircleAvatar(),
//       ),
//     );
//   }
// }
