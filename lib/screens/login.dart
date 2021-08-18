import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:movies/screens/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:movies/utilities/user_auth.dart';
import 'package:movies/widgets/button.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';


//final _firestore = Firestore.instance;

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}
class _WelcomeScreenState extends State<WelcomeScreen> {

  bool _showSpinner=false;
  void toggleSpinner(){
    setState(() {
      _showSpinner = !_showSpinner;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checklogin();
  }
  void checklogin() async
  {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    email = preferences.getString('email');
    name = preferences.getString('name');
    imageURL = preferences.getString('image');
    if(email!=null)
    {
      Navigator.pushReplacementNamed(context, HOMESCREEN.id);
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text('MOVIES',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Button(
                ttl: 'GOOGLE SIGN-IN',
                clr: Color(0xff005aa7),
                onpres: (){
                  toggleSpinner();
                  signInWithGoogle().then((onValue){
                    Navigator.pushReplacementNamed(context, HOMESCREEN.id);
                    toggleSpinner();
                  }).catchError((e){
                    print(e);
                  });


                },
              ),
//            SizedBox(
//              height: 20,
//            ),
//            Button(
//              ttl: 'Login',
//              clr: Colors.blue,
//            ),
            ],
          ),
        ),
      ),
    );
  }
}



//    .then((onValue) {
//
//_firestore.collection('users').document('auth').collection(
//'googleusers').
//add({
//'email': email, 'image': imageURL, 'name': name,});
//
//}
//).catchError((e){
//print("ERROR HERE!!!!$e");
//})