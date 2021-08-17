import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movies/screens/addmovie.dart';
import 'package:movies/screens/homepage.dart';
import 'package:movies/screens/login.dart';
import 'package:path_provider/path_provider.dart';
import 'package:movies/utilities/movieinfo.dart';
import 'package:hive_flutter/hive_flutter.dart';


// part 'main.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Directory document = await getApplicationDocumentsDirectory();
  // Hive
  //   ..init(document.path);
  //   //..registerAdapter(TypeAdapter<MovieInfo()>());
  // await Hive.openBox<MovieInfo>("cart");
  await Hive.initFlutter();
  Hive.registerAdapter(MovieInfoAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) =>WelcomeScreen(),
        HOMESCREEN.id: (context) => HOMESCREEN(),
        AddMovie.id: (context) => AddMovie(),
      },
    );
  }
}
