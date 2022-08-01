import 'package:practice/pages/users/login.dart';
import 'package:flutter/material.dart';

import '../../service/emailandpassword.dart';

class signup extends StatelessWidget {
  signup({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red,),
      backgroundColor: Colors.greenAccent,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 20),
                )),


            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),

            Container(
                height: 50,
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Sign Up'),
                  onPressed: () async {
                    signupwithemailandpass(context, nameController.text, passwordController.text);
                    await Navigator.push(context, MaterialPageRoute(builder: (context) => loginpage()));

                  },
                )),

          ],
        ),
      ),
    );
  }
}
