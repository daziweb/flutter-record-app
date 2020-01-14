import 'package:flutter/material.dart';
import './pages/home.dart';
import './pages/email.dart';

import 'dart:async';

class Index extends StatefulWidget {
  Index({Key key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> with SingleTickerProviderStateMixin {
  final _bottomNavigationColor = Colors.lightBlue;
  int _currentIndex = 0;
  var _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('再玩一会儿..'),
        actions: <Widget>[
          FlatButton(
            child: Text('取消'),
            onPressed: () => Navigator.pop(context, false),
          ),
          FlatButton(
            child: Text('确定'),
            onPressed: () => Navigator.pop(context, true),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: MaterialApp(
        theme: ThemeData(
          brightness: Theme.of(context).brightness,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        home: Scaffold(
          body: PageView(
            controller: _controller,
            children: <Widget>[Home(), Email()],
            physics: NeverScrollableScrollPhysics(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              _controller.jumpToPage(index);

              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: _bottomNavigationColor,
                ),
                title: Text(
                  'Work',
                  style: TextStyle(color: _bottomNavigationColor),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.videogame_asset,
                  color: _bottomNavigationColor,
                ),
                title: Text(
                  'Play',
                  style: TextStyle(color: _bottomNavigationColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
