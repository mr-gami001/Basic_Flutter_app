import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice/pages/users/cards.dart';
import '../admin.dart';


class itam extends StatelessWidget {
  const itam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController id = TextEditingController();
    TextEditingController date = TextEditingController();
    TextEditingController desc = TextEditingController();

    id.text = itemid;
    return Scaffold(
      appBar: AppBar(

      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          for(var item in list)if(itemid == item['id']) Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Image.network(item['image'].toString()),
              ),

              Container(
                // key: Key(item['id'].toString()),
                width: 250,
                child: TextField(
                  controller: id,
                  enabled: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Id',
                  ),
                ),
              ),Container(
                width: 250,
                // key: Key(item['id'].toString()),
                padding: EdgeInsets.symmetric(vertical: 30),
                child: TextField(
                  controller: date,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Date',
                  ),onTap: () async {
                    date.text = item['date'].toString();
                    desc.text = item['desc'].toString();
                    DateTime? updatetime = await showDatePicker(context: context,lastDate: DateTime.now(), firstDate: DateTime(1800), initialDate: DateTime.now());
                    date.text = updatetime.toString();
                },
                ),
              ),Container(
                // key: Key(item['id'].toString()),
                width: 250,
                child: TextField(
                  controller: desc,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                  ),
                ),
              ),
          Container(
            width: 100,
            child: FlatButton(child: Text('Svae it'),onPressed: () async {
              item['date'] = date.text;
              item['desc'] = desc.text;
              await Navigator.push(context, MaterialPageRoute(builder: (context)=>admin()));
            },color: Colors.red,),
          )
          // list[item]
          ],
          )
        ],
      ),
    );
  }
}
