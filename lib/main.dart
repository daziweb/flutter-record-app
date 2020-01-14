import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_record_app/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    _initAsync();
  }

  _initAsync() async {
    await SpUtil.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dagan-one-system',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SplashScreen(),
    );
  }
}
