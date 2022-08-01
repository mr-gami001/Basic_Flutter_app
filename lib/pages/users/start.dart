import 'package:practice/pages/users/home.dart';
import 'package:practice/pages/users/login.dart';
import 'package:practice/pages/users/signup.dart';
import 'package:flutter/material.dart';

import '../../service/anon.dart';

class start extends StatelessWidget {
  const start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [

            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 150),
                child: const Text(
                  'Practice',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w900,
                      fontSize: 40),
                )),

            Container(

                alignment: Alignment.center,
                padding: EdgeInsets.only(top:30),
                // height: 50,
                // padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(500, 50),
                    primary: Colors.cyan,

                  ),
                  child: const Text('Sign in as Guest',style: TextStyle(color: Colors.black),),
                  onPressed: () async{
                    signinanon(context);
                    await Navigator.push(context, MaterialPageRoute(builder: (context)=>homepage()));
                  },
                )),

            Container(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan,
                  minimumSize: Size(500, 50)
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>loginpage()));
                },
                child: Text("You have already account? Sign in",style: TextStyle(color: Colors.black),),
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(500, 50),
                  primary: Colors.cyan
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
                },
                child: Text("Create an Account",style: TextStyle(color: Colors.black),),
              ),
            )






          ],
        ),
      ),
    );
  }
}
