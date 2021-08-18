import 'package:flutter/material.dart';

import 'package:movies/screens/addmovie.dart';

class CommonAppBar extends StatefulWidget {
  // const CommonAppBar({Key? key}) : super(key: key);

  @override
  _CommonAppBarState createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff7ecdf2),
      automaticallyImplyLeading: false,
      title: Text('Movies'),
      centerTitle: true,
      actions: [
        IconButton(

            icon: Icon(Icons.add),
            onPressed: (){

              Navigator.pushReplacementNamed((context), AddMovie.id);
            }
        )
      ],
    );
  }
}
