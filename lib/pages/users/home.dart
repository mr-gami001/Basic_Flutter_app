import 'package:practice/pages/users/cards.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      drawer: drawer(),
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body:  cards(),


    );
  }
}
