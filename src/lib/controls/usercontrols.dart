import 'package:flutter/material.dart';
import '../paths/paths.dart';
import '../keys/keys.dart';
import 'dart:io';

class LabelIntDropDownItem extends StatefulWidget {
  LabelIntDropDownItem(
      {Key key,
      this.displayFunc,
      this.onChangedFunc,
      this.displayIntItems,
      this.label,
      this.inputValue,
      this.outputValue})
      : super(key: key);
  var displayFunc;
  Function(int) onChangedFunc;
  final label;
  List<int> displayIntItems;
  int inputValue;
  int outputValue;
  @override
  LabelIntDropDownItemState createState() => new LabelIntDropDownItemState();
}

//  State for Row with Label and Selectable drop down
class LabelIntDropDownItemState extends State<LabelIntDropDownItem> {
  int result;
  @override
  void initState() {
    super.initState();
    result = widget.outputValue;
  }

  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Text(widget.label),
        new Expanded(
            child: new Container(
                alignment: Alignment.bottomRight,
                child: new DropdownButtonHideUnderline(
                  child: new Container(
                    child: new DropdownButton<int>(
                      items: widget.displayIntItems.map((int value) {
                        return new DropdownMenuItem<int>(
                          value: value,
                          child: new Align(
                            alignment: Alignment.centerRight,
                            child: new Text(widget.displayFunc(value)),
                          ),
                        );
                      }).toList(),
                      value: result ?? widget.inputValue,
                      onChanged: (int value) {
                        setState(() {
                          result = value;
                          print(result);
                          widget.outputValue = value;
                          //widget.onChangedFunc(result);
                        });
                      },
                    ),
                  ),
                )))
      ],
    );
  }
}

class TopBottomLabel extends StatelessWidget {
  final String label;
  final String value;
  final Key key;

  TopBottomLabel({this.value, this.label, this.key}) : super(key: key);
  Widget build(BuildContext context) {
    return new Container(
        child: new Column(
      children: <Widget>[
        new Text(value, style: Theme.of(context).textTheme.body2),
        new Text(label, style: Theme.of(context).textTheme.caption)
      ],
    ));
  }
}

class ProfileAvatar extends StatelessWidget {
  final String playerId;
  final File latestImage;

  ProfileAvatar({this.playerId, this.latestImage});
  Widget build(BuildContext context) {
    var networkImage = new NetworkImage(TennisAiPaths.imagePath(playerId),
        headers: TennisAiPaths.zumoHeader);
    var latestAvatar = latestImage == null ? null : new FileImage(latestImage);
    return new CircleAvatar(
        radius: 36.0, backgroundImage: latestAvatar ?? networkImage);
  }
}

class AvatarFromProfileOrLocal extends StatelessWidget {
  final String playerId;
  final File latestImage;
  final String profileImageUrl;
  final bool usePublicProfile;
  AvatarFromProfileOrLocal(
      {this.playerId, this.usePublicProfile, this.profileImageUrl, this.latestImage});
  Widget build(BuildContext context) {
    NetworkImage networkImage;
    if (usePublicProfile == false && this.profileImageUrl != null) {
      networkImage = new NetworkImage(TennisAiPaths.imagePath(playerId),
          headers: TennisAiPaths.zumoHeader);
    }else{
      networkImage = new NetworkImage(this.profileImageUrl,headers: TennisAiPaths.zumoHeader);
    }
    var latestAvatar = latestImage == null ? null : new FileImage(latestImage);
    return new CircleAvatar(
        radius: 36.0, backgroundImage: latestAvatar ?? networkImage);
  }
}

class EditableProfileAvatar extends StatelessWidget {
  final String playerId;
  final String source;
  final VoidCallback onTap;
  final File defaultImage;
  EditableProfileAvatar(
      {this.playerId, this.source, this.onTap, this.defaultImage});
  Widget build(BuildContext context) {
    var networkImage = new NetworkImage(TennisAiPaths.imagePath(playerId),
        headers: TennisAiPaths.zumoHeader);
    var defaultAvatar =
        defaultImage == null ? null : new FileImage(defaultImage);
    return GestureDetector(
        onTap: onTap,
        key: TennisAiKeys.profileAvatar(source),
        child: new CircleAvatar(
            radius: 36.0, backgroundImage: defaultAvatar ?? networkImage));
  }
}


class LabelEnumDropDownItem extends StatefulWidget {
  LabelEnumDropDownItem(
      {Key key,
      this.displayFunc,
      this.onChangedFunc,
      this.displayIntItems,
      this.label,
      this.inputValue,
      this.outputValue})
      : super(key: key);
  var displayFunc;
  Function(String) onChangedFunc;
  final label;
  List<String> displayIntItems;
  String inputValue;
  String outputValue;
  @override
  LabelEnumDropDownItemState createState() => new LabelEnumDropDownItemState();
}

//  State for Row with Label and Selectable drop down
class LabelEnumDropDownItemState extends State<LabelEnumDropDownItem> {
  String result;
  @override
  void initState() {
    super.initState();
    result = widget.outputValue;
  }

  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Text(widget.label),
        new Expanded(
            child: new Container(
                alignment: Alignment.bottomRight,
                child: new DropdownButtonHideUnderline(
                  child: new Container(
                    child: new DropdownButton<String>(
                      items: widget.displayIntItems.map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Align(
                            alignment: Alignment.centerRight,
                            child: new Text(widget.displayFunc(value)),
                          ),
                        );
                      }).toList(),
                      value: result ?? widget.inputValue,
                      onChanged: (String value) {
                        setState(() {
                          result = value;
                          print(result);
                          widget.outputValue = value;
                          //widget.onChangedFunc(result);
                        });
                      },
                    ),
                  ),
                )))
      ],
    );
  }
}


class Drawhorizontalline extends CustomPainter {
  Paint _paint;

  Drawhorizontalline() {
    _paint = Paint()
      ..color = Colors.black12
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
      canvas.drawLine(Offset(-90.0, 0.0), Offset(90.0, 0.0), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}