import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'pages/calculator_page.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: CalculatorPage(),
      title: Text(
        'Make your calculus',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
      ),
      image: Image.asset('assets/image/web_hi_res_512'),
      backgroundColor: Colors.black,
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 150.0,
      loaderColor: Colors.white,
    );
  }
}
