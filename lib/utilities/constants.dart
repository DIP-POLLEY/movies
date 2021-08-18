import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const kBoxfield = InputDecoration(
  hintText: 'Enter your email',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.green, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kStringStyles = TextStyle(
  fontSize: 10,
  fontWeight: FontWeight.bold,
  color: Colors.white,

);

const kCardString = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
  color: Color(0xff758085),
  // color: Colors.white,
);

const kAlertText = TextStyle(
  fontSize: 15,
  color: Colors.white
);