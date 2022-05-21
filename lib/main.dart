import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

import 'package:my_app/home.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
  debugPaintSizeEnabled = false;
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge); //to make the app remove the top of appbar (immersive)
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'NFT Store',
      home: const Home(),
    );
  }
}
