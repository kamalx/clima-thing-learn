import 'package:flutter/material.dart';
import 'package:Clima/screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}

/*
* NOTE:
* https://medium.com/androiddevelopers/picking-your-compilesdkversion-minsdkversion-targetsdkversion-a098a0341ebd
* compileSdkVersion for this app was changed to 30
* There are issues with this app not working only in release builds.
* The debug builds seem to be working fine.
*
* */
