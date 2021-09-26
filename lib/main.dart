
import 'package:flutter/material.dart';
import 'package:loginauth/scrrens/Authie.dart';
import 'package:loginauth/scrrens/Mobile.dart';
import 'package:loginauth/scrrens/Welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loginauth/scrrens/Selection.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Welcome.x,
      routes: {
        Welcome.x:(context)=>Welcome(),
        Mobile.y:(context)=>Mobile(),
        Authie.z:(context)=>Authie(phone:""),
        Selection.w:(context)=>Selection(),
      },
    );
  }
}
