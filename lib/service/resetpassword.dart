import 'package:practice/service/emailandpassword.dart';
import 'package:flutter/material.dart';

import '../pages/users/login.dart';

class resetpass extends StatelessWidget {
  resetpass({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.deepOrangeAccent,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 50),
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Reset Password',
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
                height: 50,
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text("Reset Password"),
                  onPressed: () async {
                    resetpassword(context, email: nameController.text);
                    await Navigator.push(context, MaterialPageRoute(builder: (context) => loginpage()));

                  },
                )),
            
          ],
        ),
      ),
    );
  }
}
