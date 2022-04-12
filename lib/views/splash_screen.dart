import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mufirebase/views/sign_in.dart';
import 'package:mufirebase/views/sign_up.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), ()=>Navigator.push(context, CupertinoPageRoute(builder: (context)=>SignUp())));
    return Scaffold(
      body: Center(
        child: CircleAvatar(),
      ),
    );
  }
}
