import 'package:practice/pages/admin.dart';
import 'package:practice/service/resetpassword.dart';
import 'package:practice/pages/users/signup.dart';
import 'package:practice/service/anon.dart';
import 'package:practice/service/emailandpassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class loginpage extends StatefulWidget {
  loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,

      appBar: AppBar(
        backgroundColor: Colors.red,
      ),

      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[


              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
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


              TextButton(
                onPressed: () {
                  // resetpassword(context, email: nameController.text);
                  //forgot password screen
                  Navigator.push(context, MaterialPageRoute(builder: (context) => resetpass()));
                },
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red
                  ),
                ),
              ),


              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                        signinwithemailandpass(context, nameController.text,
                            passwordController.text);

                    },
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () async {
                        // signupwithemailandpass(context,nameController.text, passwordController.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => signup()));
                        //signup screen
                      })
                ],
              ),

            ],
          )),
    );
  }
}

