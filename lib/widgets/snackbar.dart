import 'package:flutter/material.dart';

void showSnackBar({
  BuildContext context,String message, Color backgrndclr
}){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: backgrndclr,
    elevation: 10,
  ));
}