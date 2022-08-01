
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;
User? user;

Future<void> signinanon(context) async{
  try {
    var credential = await auth.signInAnonymously();
    user = credential.user;
    var id = user?.uid.hashCode;
    print("$id");
    if (credential != null) {
      showDialog(context: context,
          builder: (BuildContext context) =>
              AlertDialog(title: Text("Sign in  Sucessfully"),));
    }
  }on FirebaseAuthException catch(e){
    showDialog(context: context, builder: (BuildContext context)=>AlertDialog(title: Text("$e"),));
  }
}