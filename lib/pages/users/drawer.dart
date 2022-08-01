import 'package:practice/pages/users/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
FirebaseAuth auth = FirebaseAuth.instance;


class drawer extends StatefulWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {

    var user = auth.currentUser;
    var id = user?.uid.hashCode;
 var mail = user?.email;
 var username = user?.displayName;
    // var name = user?.email;
    return Drawer(
      child: Column(
          children: [
            if(mail==null)...[
              UserAccountsDrawerHeader(accountEmail: Text("user id : $id"), accountName: Text("Your Logged in as Guest"),),
              anon(),

            ]
            else if(mail=='www.divyeshgami@gmail.com')...[
              UserAccountsDrawerHeader(accountEmail: Text("user id : $id"), accountName: Text("Name : Admin"),),
              email()
            ]
            else...[
              UserAccountsDrawerHeader(accountEmail: Text("user id : $id"), accountName: Text("Name : $username"),),
              email()
            ],
            // UserAccountsDrawerHeader(accountName: Text("name"), accountEmail: Text("email"))

          ],
      ),
    );
  }
}

class anon extends StatelessWidget {
  const anon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          trailing: Icon(Icons.navigate_next),
          onTap: (){},
        ),



        ListTile(
          leading: Icon(Icons.logout),
          title: Text("Log Out"),
          trailing: Icon(Icons.navigate_next),
          onTap: ()async{
            await auth.signOut();
            Navigator.pushReplacementNamed(context, '/');}
        )

      ],
    );
  }
}

class email extends StatelessWidget {
  const email({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          trailing: Icon(Icons.navigate_next),
          onTap: (){},
        ),

        ListTile(
          leading: Icon(CupertinoIcons.profile_circled),
          title: Text("Profile"),
          trailing: Icon(Icons.navigate_next),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>profile()));
          },
        ),


        ListTile(
          leading: Icon(Icons.logout),
          title: Text("Log Out"),
          trailing: Icon(Icons.navigate_next),
          onTap: ()async{
            await auth.signOut();
            Navigator.pushReplacementNamed(context, '/');}
        )

      ],
    );
  }
}
