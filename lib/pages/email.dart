import 'package:flutter/material.dart';

class Email extends StatefulWidget {
  Email({Key key}) : super(key: key);

  @override
  _EmailState createState() => _EmailState();
}

class _EmailState extends State<Email>  with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    
    super.build(context);
    return Container(
       child: Text('email'),
    );
  }
}
