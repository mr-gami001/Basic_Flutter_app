
import 'package:cross_file_image/cross_file_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice/pages/users/home.dart';


XFile? image;


class profile extends StatefulWidget {
  profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  TextEditingController _name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController dob = TextEditingController();


  @override
  Widget build(BuildContext context) {


    FirebaseAuth auth = FirebaseAuth.instance;
    var user = auth.currentUser;
    var mail = user?.email;
    email.text = mail.toString();
    var username = user?.displayName;
    _name.text = username!;

    // Image imag = imagepic() as Image;


    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>homepage())); },),
        actions: [
          IconButton(onPressed: (){
            user?.updateProfile(
              displayName: _name.text,
            );

          }, icon: Icon(Icons.save))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(30, 40, 20, 20),
          child: Column(
            children: [


              Container(
                // margin: EdgeInsets.(0, 20, 0, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(

                    ),

                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        // color: Colors.pink,
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: image == null ? Text("choose Image"): Image(image: XFileImage(image!)),
                    ),


                    MaterialButton(
                      child: Text("Change Image"),
                      color: Colors.yellow,
                      onPressed: ()async{


                        XFile? imag = await ImagePicker().pickImage(source: ImageSource.gallery);
                        if(imag!=null){
                          image = imag;
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>profile()));
                        }else{
                          showDialog(context: context, builder: (context)=>AlertDialog(title: Text("please select image")));
                        }
                      }
                    )
                    ]

                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 40),
                width: 500,
                child: TextField(
                  controller: _name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter Name"),
                    hintText: "firstname lastname",
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 8),
                width: 500,
                child: TextField(
                  controller: email,
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 8),
                width: 500,
                child: TextField(
                  controller: dob,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Date of Birth")
                  ),
                  onTap: ()async{
                    DateTime? newdob = await showDatePicker(context: context,lastDate: DateTime.now(), firstDate: DateTime(1800), initialDate: DateTime.now());
                    if(newdob!=null && newdob!=DateTime.now()){
                      dob.text = newdob.toString();
                    }
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
