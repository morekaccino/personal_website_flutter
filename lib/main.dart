import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:personal_website_flutter/card_widget.dart';
import 'package:firebase_core/firebase_core.dart';

import 'bubble_background.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAd7rcwbno7VnykDMPJKIderJW1BDxUKFY",
          authDomain: "personal-website-ac827.firebaseapp.com",
          projectId: "personal-website-ac827",
          storageBucket: "personal-website-ac827.appspot.com",
          messagingSenderId: "456815641719",
          appId: "1:456815641719:web:ac63b1915d45a276d5f272",
          measurementId: "G-L4NRM6DFPF"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mohamad Kazemi',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(body: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Duration _duration = const Duration(seconds: 30);

  final _colors = const <Color>[
    Color(0xffCE84A3),
    Color(0xff694D8C),
    Color(0xffCBAABB),
    Color(0xff583C79),
    Color(0xffDAA0A7),
    Color(0xff688AC8),
    Color(0xff2F74B0),
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10))
        .then((value) => setState(() {}));
    Timer.periodic(_duration, (Timer t) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: const Color(0xff3060a8),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Bubble(
              duration: _duration,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              color: _colors[0]),
          Bubble(
              duration: _duration,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              color: _colors[1]),
          Bubble(
              duration: _duration,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              color: _colors[2]),
          Bubble(
              duration: _duration,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              color: _colors[3]),
          Bubble(
              duration: _duration,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              color: _colors[4]),
          Bubble(
              duration: _duration,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              color: _colors[5]),
          Bubble(
              duration: _duration,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              color: _colors[6]),
          Bubble(
              duration: _duration,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              color: _colors[0]),
          Bubble(
              duration: _duration,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              color: _colors[1]),
          Bubble(
              duration: _duration,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              color: _colors[2]),
          Bubble(
              duration: _duration,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              color: _colors[3]),
          Bubble(
              duration: _duration,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              color: _colors[4]),
          Bubble(
              duration: _duration,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              color: _colors[5]),
          Bubble(
              duration: _duration,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              color: _colors[6]),
          Positioned(
            left: 0,
            top: 0,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 70, sigmaX: 70),
              child: Container(
                color: const Color(0xff000000).withOpacity(.2),
                height: screenHeight,
                width: screenWidth,
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      InfoCardWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
