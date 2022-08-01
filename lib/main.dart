

import 'package:practice/pages/admin.dart';
import 'package:practice/pages/users/cards.dart';
import 'package:practice/pages/users/drawer.dart';
import 'package:practice/pages/users/home.dart';
import 'package:practice/pages/users/login.dart';
import 'package:practice/pages/users/profile.dart';
import 'package:practice/service/resetpassword.dart';
import 'package:practice/pages/users/signup.dart';
import 'package:practice/pages/users/start.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      MaterialApp(



        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple
        ),

        routes: {
          "/" : (context) => start(),
          "/homepage"         : (context) => homepage(),
          "/login"    :(context) => loginpage(),
          "/signup" : (context) => signup(),
          "/resetpass" : (context) => resetpass(),
          "/profile" : (context) => profile(),
          "/admin" : (context) => admin(),
          "/start": (context)=> start(),
          "/cards": (context)=> cards(),
          "/drawer": (context)=> drawer(),

        },

        // themeMode: ThemeMode.dark,
        // darkTheme: ThemeData(
        //     brightness: Brightness.dark
        // ),

        // debugShowCheckedModeBanner: false,
      ),
  );
}


// class home extends StatelessWidget {
//   const home({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     int days = 30;
//     double day1 = 30;
//
//     return Container(
//       child: Center(child: Text("helllo $days $day1")),
//     );
//   }
// }
