import 'package:flutter/material.dart';
import 'package:movies/utilities/constants.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:movies/widgets/RoundButton.dart';
// import 'package:movies/widgets/card.dart';
import 'package:movies/widgets/commonAppbar.dart';
import 'package:movies/utilities/streamer.dart';
import 'package:movies/utilities/user_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies/screens/login.dart';


class HOMESCREEN extends StatefulWidget {
  // const HOMESCREEN({Key? key}) : super(key: key);
  static const String id = "home";
  @override
  _HOMESCREENState createState() => _HOMESCREENState();
}

class _HOMESCREENState extends State<HOMESCREEN> {



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.topLeft,
          colors: [Color(0xff00c6ff),Color(0xff0072ff)]
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CommonAppBar(),
        ),

        body: Column(
          children: [
            Expanded(
              flex: 1,
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        child: Container(

                          width: MediaQuery.of(context).orientation == Orientation.portrait?60:0,
                          height: MediaQuery.of(context).orientation == Orientation.portrait?60:0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(imageURL),
                                fit:BoxFit.fill,
                              )
                          ),
                        ),
                        onTap: (){
                          Alert(context: context,
                              type: AlertType.warning,
                              title: "Logout",
                            desc: "Data will be erased after you logout",
                            buttons: [
                              DialogButton(
                                  color: Colors.lightGreen,
                                  child: Text(
                                    "Cancel",
                                    style: kAlertText,
                                  ),
                                  onPressed: (){
                                    Navigator.pop(context);

                                  }

                                  ),
                              DialogButton(
                                  color: Colors.redAccent,
                                  child: Text(
                                    "Logout",
                                    style: kAlertText,
                                  ),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                    signOutGoogle();
                                    Hive.box('movies').clear();
                                    Navigator.pushNamed((context), WelcomeScreen.id);
                                  }
                              )
                            ]
                          ).show();

                        },
                      ),
                      Text(
                          "Welcome, $name",
                        textAlign: TextAlign.center,
                        style: kStringStyles,
                      ),

                    ],
                  ),
                )
            ),
            Expanded(
              flex: 3,

                child: Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.topLeft,
                            colors: [Color(0xfff7f7f7),Color(0xfffcf5f5)]
                        ),
                    ),
                    child: CardStream()
                )
            ),
          //   FloatingActionButton(
          //   autofocus: true,
          //   onPressed: (){
          //     Navigator.pushNamed((context), AddMovie.id);
          //   },
          //   child: Icon(
          //     Icons.add,
          //     color: Colors.white,
          //   ),
          // )
          ],
        ),
      ),
    );
  }
}

