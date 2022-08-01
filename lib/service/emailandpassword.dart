import 'package:practice/pages/admin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/users/home.dart';

FirebaseAuth auth = FirebaseAuth.instance;
User? user;
var account;

Future<void> signupwithemailandpass(context,email, pass) async {
  try {
    UserCredential credential = await auth.createUserWithEmailAndPassword(email: email, password: pass);
    if(credential != null){
      showDialog(context: context, builder: (BuildContext context)=>AlertDialog(title: Text("User create Sucessfully !!"),));
    }
    //for the user ud show in console
    user = credential.user;
    var id = user?.uid.hashCode;
    print("id === $id");

  }on FirebaseAuthException catch(e){
    var code = e.code;
    code = code.replaceAll("-", " ");
    showDialog(context: context, builder: (BuildContext context)=>AlertDialog(title: Text(code),));
  }
}

Future<void> signinwithemailandpass(context,emailAddress, password) async{
  try {
    final credential = await auth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password
    );
    if(emailAddress == "www.divyeshgami@gmail.com"){
      user?.updateProfile(displayName: "Admin");
      await Navigator.push(context, MaterialPageRoute(builder: (context)=>admin()));
    }
    else if(credential != null) {
      user = credential.user;
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => homepage()));
    }
  } on FirebaseAuthException catch (e) {
    var code = e.code;
    code = code.replaceAll("-", " ");
    showDialog(context: context, builder: (BuildContext context)=>AlertDialog(title: Text(code),));
  }
}


Future<void> resetpassword(context,{required email}) async {
  try {
    await auth.sendPasswordResetEmail(email: email);
    showDialog(context: context, builder: (BuildContext context)=>AlertDialog(title: Text("check your mail"),));
  }on FirebaseAuthException catch(e) {
    var code = e.code;
    code = code.replaceAll("-", " ");
    showDialog(context: context, builder: (BuildContext context)=>AlertDialog(title: Text(code),));
  }
}
