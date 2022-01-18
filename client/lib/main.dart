import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:se_app2/Home/hotel/hotel.dart';
import 'package:se_app2/navigator/nav/profile/profile.dart';
import 'package:se_app2/navigator/nav.dart';
import 'Home/shuttle/shuttle.dart';
import 'navigator/nav.dart';

void main() async{
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor:
      SystemUiOverlayStyle.dark.systemNavigationBarColor,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(home: hotel()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'traveldgwa',
      routes: <String,WidgetBuilder>{
        '/Navi' : (BuildContext context)=> Nav(),
        '/airport_shuttle' : (BuildContext context)=> shuttle(),
        '/hotel ' : (BuildContext context)=> hotel(),
        '/profile' : (BuildContext context)=> profile(),
      },
    );
  }
}