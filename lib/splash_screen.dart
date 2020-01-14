import 'package:flutter/material.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter_record_app/index.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  TimerUtil timer;
  int tick;

  _initTimer() {
    timer = new TimerUtil(mInterval: 1000, mTotalTime: 5 * 1000);

    timer.setOnTimerTickCallback((int value) {
      double _tick = value / 1000;

      if (_tick.toInt() == 1) {
        // Navigator.of(context).pushAndRemoveUntil(
        //     MaterialPageRoute(builder: (context) => Index()),
        //     (route) => route == null);
      }

      setState(() {
        tick = _tick.toInt();
      });
    });
    timer.startCountDown();
  }

  @override
  void initState() {
    super.initState();

    // 倒计时
    _initTimer();
  }

  @override
  void dispose() {
    if (timer != null) timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/start.png'),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            right: 10,
            bottom: 10,
            child: Container(
              width: 60,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  width: 1,
                  color: Colors.white12,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  child: Text(
                    '$tick' + 's 跳过',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Index()),
                        (route) => route == null);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
