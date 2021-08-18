import 'package:flutter/material.dart';
import 'package:movies/screens/login.dart';
import 'package:movies/utilities/user_auth.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CommonAppBar extends StatefulWidget {
  // const CommonAppBar({Key? key}) : super(key: key);

  @override
  _CommonAppBarState createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red,
      title: Text('Movies'),
      centerTitle: true,
      actions: [
        IconButton(
            icon: Icon(Icons.toggle_off),
            onPressed: () {
              Navigator.of(context).pop();
              signOutGoogle();
              Hive.box('movies').clear();
              Navigator.pushNamed((context), WelcomeScreen.id);
            }
            // icon: Icon(Icons.add),
            // onPressed: (){
            //
            //   Navigator.pushReplacementNamed((context), AddMovie.id);
            // }
        )
      ],
    );
  }
}
