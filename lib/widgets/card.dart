import 'dart:io';
import 'dart:convert';
import 'dart:typed_data' show Uint8List;

import 'package:flutter/material.dart';
import 'package:movies/main.dart';
import 'package:movies/utilities/user_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies/widgets/RoundButton.dart';
import 'package:movies/screens/homepage.dart';
import 'package:path_provider/path_provider.dart';


class MovieCard extends StatefulWidget {
  // const MovieCard({Key? key}) : super(key: key);
  MovieCard ({this.nam,this.dict,this.img});
  final String nam,dict,img;
  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  String _nam,_dict,_img;
  File _image;
  void converttoImage() async
  {
    Uint8List decodedBytes = base64Decode(_img);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File fl = File("$dir/"+DateTime.now().millisecondsSinceEpoch.toString()+"jpg");
    await fl.writeAsBytesSync(decodedBytes);

    setState(() {
      _image = fl;
      print("Now Done");
    });
  }
  void initState(){
    super.initState();
    _nam = widget.nam;
    _dict = widget.dict;
    _img = widget.img;
    converttoImage();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
      child: Container(

        // height: 100,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: _image==null?Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(imageURL),
                      fit:BoxFit.fill,
                    )
                ),
              ):
              Image.file(
                _image,
                width: 50,
                height: 50,
                fit: BoxFit.fitHeight,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 3),
                child: Container(
                  color: Colors.green,
                  child: Column(
                    children: [
                      Text(
                        _nam,
                      ),
                      Text(
                        _dict,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: RoundButton(
                              icn: FontAwesomeIcons.share,//delete
                              tap: (){
                                box.delete(_nam);
                                Navigator.pushReplacementNamed(context, HOMESCREEN.id);
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: RoundButton(
                              icn: FontAwesomeIcons.pen,//edit
                              tap: (){

                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
            )
          ],

        ),

      ),
    );
  }
}



// child: Image.file(
// _image,
// width: 50,
// height: 50,
// fit: BoxFit.fitHeight,
// ),