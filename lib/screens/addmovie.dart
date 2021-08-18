import 'dart:io';
import 'dart:convert' show base64Encode;
import 'dart:typed_data' show Uint8List;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:movies/screens/homepage.dart';
// import 'package:movies/utilities/boxes.dart';
import 'package:movies/utilities/constants.dart';
import 'package:movies/utilities/movieinfo.dart';
import 'package:movies/widgets/RoundButton.dart';
import 'package:movies/widgets/commonAppbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movies/widgets/button.dart';
import 'package:movies/main.dart';
import 'package:movies/widgets/snackbar.dart';


class AddMovie extends StatefulWidget {
  // const AddMovie({Key? key}) : super(key: key);
  static const String id = 'addmov';
  @override
  _AddMovieState createState() => _AddMovieState();
}
File _image;
class _AddMovieState extends State<AddMovie> {


  String s1,s2;
  final List<MovieInfo> mycart = [];

  bool _showSpinner = false;

  void toggleSpinner()
  {
    setState(() {
      _showSpinner = !_showSpinner;
    });
  }



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
    _image=null;

  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _showSpinner,
      child: Scaffold(
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
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
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
                clr: Color(0xff4ea9f0),
                onpres: () async {
                  if(s1 == ""||s1==null)
                    {
                      showSnackBar(
                        context: context,
                        message: "Please provide a movie name",
                        backgrndclr: Colors.redAccent,

                      );
                    }
                  else if(s2 == ""||s2==null)
                    {
                      showSnackBar(
                        context: context,
                        message: "Please provide a director name",
                        backgrndclr: Colors.redAccent,

                      );
                    }
                  else if(_image == null)
                    {
                      showSnackBar(
                        context: context,
                        message: "Please upload a poster",
                        backgrndclr: Colors.redAccent,

                      );
                    }
                  else
                    {
                      toggleSpinner();

                      Uint8List bytesImg = _image.readAsBytesSync();
                      String base64EncodeImg = base64Encode(bytesImg);
                      var movie = MovieInfo(
                          movnam: s1,
                          dictnam: s2,
                          movimg: base64EncodeImg
                      );
                      await box.put(s1,movie);
                      print(box.get(s1).movnam);
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, HOMESCREEN.id);
                      toggleSpinner();
                    }


                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
