import 'package:flutter/material.dart';



var list = [
  {'id':"1","date":"20/08/2016",'image':'https://picsum.photos/seed/picsum/200/300',"desc":"this is basic random picture which is shown in left side"},
  {'id':"2","date":"26/08/2016",'image':'https://picsum.photos/200/300?grayscale',"desc":"this is basic random picture which is shown in left side"},
  {'id':"3","date":"26/08/2016",'image':'https://picsum.photos/200/300/?blur',"desc":"this is basic random picture which is shown in left side"},
  {'id':"4","date":"26/08/2016",'image':'https://loremflickr.com/113/170',"desc":"this is basic random picture which is shown in left side"},
  {'id':"5","date":"26/08/2016",'image':'https://loremflickr.com/113/175',"desc":"this is basic random picture which is shown in left side"},
  {'id':"6","date":"26/08/2016",'image':'https://loremflickr.com/113/167',"desc":"this is basic random picture which is shown in left side"},
  {'id':"7","date":"26/08/2016",'image':'https://loremflickr.com/113/168',"desc":"this is basic random picture which is shown in left side"},
  {'id':"8","date":"26/08/2016",'image':'https://loremflickr.com/113/169',"desc":"this is basic random picture which is shown in left side"},
  {'id':"9","date":"26/08/2016",'image':'https://loremflickr.com/113/174',"desc":"this is basic random picture which is shown in left side"},
  {'id':"10","date":"26/08/2016",'image':'https://loremflickr.com/113/173',"desc":"this is basic random picture which is shown in left side"},
  {'id':"11","date":"26/08/2016",'image':'https://loremflickr.com/113/172',"desc":"this is basic random picture which is shown in left side"},
  {'id':"12","date":"26/08/2016",'image':'https://loremflickr.com/113/171',"desc":"this is basic random picture which is shown in left side"},
  {'id':"13","date":"26/08/2016",'image':'https://loremflickr.com/113/171',"desc":"this is basic random picture which is shown in left side"},
];

class cards extends StatelessWidget {
  const cards({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.pink,
      body: ListView(
          children: [
            for(var item in list) Card(

              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),

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
                      mainAxisAlignment: MainAxisAlignment.center,
                        children:[

                          Container(
                            // key: Key(item['id'].toString()),
                            width: 250,
                            child: Text("Image id : "+item['id'].toString(),style: TextStyle(fontSize: 20,),),
                          ),Container(
                            width: 250,
                            // key: Key(item['id'].toString()),
                            child: Text("Image date : "+item['date'].toString()),
                          ),Container(
                            // key: Key(item['id'].toString()),
                            width: 250,
                            child: Text("Discription : "+item['desc'].toString()),
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
