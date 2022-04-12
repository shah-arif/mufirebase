import 'package:flutter/material.dart';
import 'package:mufirebase/helper/auth_helper.dart';
import 'package:mufirebase/views/sign_up.dart';

class SignIn extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
            ),
            TextField(
              controller: _passController,
            ),
            TextButton(onPressed: (){
              final userEmail = _emailController.text;
              final userPass = _passController.text;
              var obj = AuthHelper();
              obj.signIn(userEmail, userPass, context);
            }, child: Text("Sign In")),
            TextButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp())), child: Text("Don't have any account? SignUp")),
          ],
        ),
      ),
    );
  }
}
