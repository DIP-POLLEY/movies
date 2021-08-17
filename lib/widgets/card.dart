import 'package:flutter/material.dart';
import 'package:movies/utilities/user_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies/widgets/RoundButton.dart';


class MovieCard extends StatefulWidget {
  // const MovieCard({Key? key}) : super(key: key);
  MovieCard ({this.nam,this.dict});
  final String nam,dict;
  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  String _nam,_dict;
  void initState(){
    super.initState();
    _nam = widget.nam;
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
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(imageURL),
                      fit:BoxFit.fill,
                    )
                ),
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
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: RoundButton(
                              icn: FontAwesomeIcons.share,//delete
                              tap: (){},
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: RoundButton(
                              icn: FontAwesomeIcons.pen,//edit
                              tap: (){},
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
