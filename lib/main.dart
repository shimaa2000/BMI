import 'package:bmi/home.dart';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp() ;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.white70,size: 80),
        canvasColor: Colors.black,
        textTheme: TextTheme(headline2: TextStyle(fontSize: 26,
          fontWeight: FontWeight.bold, color: Colors.white70,),headline4: TextStyle(
          fontWeight: FontWeight.bold)),

      ),
    );
  }
}
