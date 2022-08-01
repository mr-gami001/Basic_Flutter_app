import 'package:practice/pages/users/drawer.dart';
import 'package:flutter/material.dart';
import 'package:practice/pages/users/itam.dart';
import 'users/cards.dart';


var itemid;
class admin extends StatelessWidget {
  const admin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(),
      backgroundColor: Colors.pink,
      body: ListView(
        children: [
          for (var item in list)
            Card(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                // width: 100,
                height: 200,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(10),
                      height: 170,
                      width: 113.5,
                      decoration: BoxDecoration(
                        // color: Colors.white,

                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          child: Image.network(item['image'].toString())),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            // key: Key(item['id'].toString()),
                            margin: EdgeInsets.only(top: 40),
                            width: 250,
                            child: Text(
                              "Image id : " + item['id'].toString(),
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            width: 250,
                            // key: Key(item['id'].toString()),
                            child:
                                Text("Image date : " + item['date'].toString()),
                          ),
                          Container(
                            // key: Key(item['id'].toString()),
                            width: 250,
                            child: Text(
                                "Discription : " + item['desc'].toString()),
                          ),
                          Container(
                            // key: Key(item['id'].toString()),
                            // alignment: Alignment.,

                            width: 250,
                            // margin: EdgeInsets.all(5),
                            child: Row(children: [
                              FlatButton(
                                child: Row(children: [
                                  Icon(Icons.close),
                                  Text('Remove')
                                ]),
                                onPressed: () {
                                  list.remove(item);
                                  // list.update();
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>admin()));
                                },
                                color: Colors.red,
                                height: 10,
                                padding: EdgeInsets.only(left: 10),
                              ),
                              Text("         "),
                              FlatButton(
                                child: Row(
                                    children: [Icon(Icons.edit), Text('Edit')]),
                                onPressed: () {
                                  var id = item['id'];
                                  itemid = id;
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>itam()));
                                },
                                color: Colors.red,
                                height: 10,
                                padding: EdgeInsets.only(left: 10),
                              ),
                            ]),
                          )
                        ]),
                  ],
                ),
              ),
            )
          // list[item]
        ],
      ),
    );
  }
}
