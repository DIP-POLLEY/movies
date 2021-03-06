import 'dart:io';
import 'dart:convert';
import 'dart:typed_data' show Uint8List;

import 'package:flutter/material.dart';
import 'package:movies/main.dart';
import 'package:movies/screens/update.dart';
import 'package:movies/utilities/constants.dart';
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
     fl.writeAsBytesSync(decodedBytes);

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
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.black12,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.file(
                      _image,
                      width: 100,
                      height: 95,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 3),
                child: Container(
                  // color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "$_nam",
                        style: kCardString,
                      ),
                      Text(
                        "by",
                        style: kCardString.copyWith(
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        _dict,
                        style: kCardString.copyWith(
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: RoundButton(
                                icn: FontAwesomeIcons.trash,//delete
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
                                  Navigator.of(context).pop();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UpdateMovie(
                                            nam: _nam,
                                            dic: _dict,
                                            img64: _img,
                                            imgn64: _image,
                                          )
                                      ),
                                  );
                                },
                              ),
                            ),

                          ],
                        ),
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
          // gradient: LinearGradient(
          //     colors: [Color(0xff3494e6),Color(0xffec6ead)]
          // ),

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