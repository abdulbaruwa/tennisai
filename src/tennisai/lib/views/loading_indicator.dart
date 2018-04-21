import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  LoadingIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    new Container(
      color: Colors.indigo,
      child: 
    new Center(
        child: 
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        new Text('Tennis.Ai', style: Theme.of(context).accentTextTheme.display1),
          new CircularProgressIndicator()]),
    ));
  }
}
