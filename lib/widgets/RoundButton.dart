import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  // const RoundButton({Key? key}) : super(key: key);
  RoundButton({this.icn,this.tap});

  final Function tap;
  final IconData icn;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: tap,
      elevation: 5,
      child: Icon(
        icn,
        color: Colors.black12,
      ),
      constraints: BoxConstraints.tightFor(width: 90,height: 45),
      shape: CircleBorder(),
      fillColor: Colors.white,
    );
  }
}
