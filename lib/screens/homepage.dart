import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies/widgets/RoundButton.dart';
import 'package:movies/widgets/card.dart';
import 'package:movies/widgets/commonAppbar.dart';
import 'package:movies/screens/addmovie.dart';


class HOMESCREEN extends StatefulWidget {
  // const HOMESCREEN({Key? key}) : super(key: key);
  static const String id = "home";
  @override
  _HOMESCREENState createState() => _HOMESCREENState();
}

class _HOMESCREENState extends State<HOMESCREEN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CommonAppBar(),
      ),
      body: ListView(
        children: <Widget>[
          MovieCard(),
          RoundButton(
            icn: FontAwesomeIcons.share,
            tap: (){},
          ),
          RoundButton(
            icn: FontAwesomeIcons.pen,
            tap: (){},
          ),
          FloatingActionButton(
            autofocus: true,
            onPressed: (){
              Navigator.pushNamed((context), AddMovie.id);
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          )

        ],
      ),
    );
  }
}

