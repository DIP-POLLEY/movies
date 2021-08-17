import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movies/widgets/card.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CardStream extends StatefulWidget {
  // const CardStream({Key? key}) : super(key: key);

  @override
  _CardStreamState createState() => _CardStreamState();
}

class _CardStreamState extends State<CardStream> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box('movies').listenable(),
        builder: (context, Box bx,_){
          return ListView.separated(

              itemBuilder: (context,index){
                final key = bx.keys.toList()[index];
                // final len = bx.keys.toList().length;
                // print(len);
                final value = bx.get(key);

                return MovieCard(
                nam: value.movnam,

                );
              },
              separatorBuilder: (_,index)=> Divider(),
              itemCount: bx.keys.toList().length,
          );
        }
    );
  }
}
