import 'package:flutter/material.dart';
import 'package:mufirebase/views/sign_in.dart';

class SignUp extends StatelessWidget {
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
            TextButton(onPressed: (){}, child: Text("Sign Up")),
            TextButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn())), child: Text("Already have an account? Login")),
          ],
        ),
      ),
    );
  }
}
