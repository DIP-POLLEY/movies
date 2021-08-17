import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies/utilities/constants.dart';
import 'package:movies/utilities/movieinfo.dart';
import 'package:movies/widgets/RoundButton.dart';
import 'package:movies/widgets/commonAppbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movies/widgets/button.dart';

class AddMovie extends StatefulWidget {
  // const AddMovie({Key? key}) : super(key: key);
  static const String id = 'addmov';
  @override
  _AddMovieState createState() => _AddMovieState();
}
File _image;
class _AddMovieState extends State<AddMovie> {


  Box<MovieInfo> mycart;
  String s1,s2;

  Future _imgFromCamera() async {
    PickedFile image = await ImagePicker().getImage(
        source: ImageSource.camera,
    );

    // setState(() {
    // if(image!=null) {
      setState(() {

        _image = File(image.path);

      });
    // }

    // });
  }

  Future _imgFromGallery() async {
    PickedFile image = await  ImagePicker().getImage(
        source: ImageSource.gallery,
    );


    setState(() {

        _image = File(image.path);

    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mycart = Hive.box<MovieInfo>("cart");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CommonAppBar(),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          CircleAvatar(
            radius: 55,
            backgroundColor: Colors.black12,
            child: _image != null?
            ClipRect(
              // borderRadius: BorderRadius.circular(50),
              child: Image.file(
                _image,
                width: 100,
                height: 100,
                fit: BoxFit.fitHeight,
              ),
            ):
            Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(50),
              ),
              width: 100,
              height: 100,
              child: Icon(
                Icons.camera_alt,
                color: Colors.grey,
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundButton(
                  icn: FontAwesomeIcons.image,
                  tap: (){
                    _imgFromGallery();
                  },
                ),
                RoundButton(
                  icn: FontAwesomeIcons.camera,
                  tap: (){
                    _imgFromCamera();
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 40),
            child: TextField(
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              decoration: kBoxfield.copyWith(
                hintText: "Movie Name Here"
              ),
              onChanged: (value){
                s1 = value;
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 40),
            child: TextField(
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              decoration: kBoxfield.copyWith(
                  hintText: "Director Name Here"
              ),
              onChanged: (value){
                s2 = value;
              },

            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 80),
            child: Button(
              ttl: 'Submit',
              clr: Colors.redAccent,
              onpres: () async{
                var movie = MovieInfo(
                  movnam: s1,
                  dictnam: s2,
                  movimg: _image
                );
                await mycart.put(s1, movie);
                //print(mycart.get(s1));
              },
            ),
          ),

        ],
      ),
    );
  }
}
