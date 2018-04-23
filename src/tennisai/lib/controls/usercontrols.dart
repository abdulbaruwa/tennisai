import 'package:flutter/material.dart';
import '../paths/paths.dart';
import '../keys/keys.dart';

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
    result = widget.inputValue;
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
                          child: new Align(alignment: Alignment.centerRight,
                            child: new Text(widget.displayFunc(value)),
                          ),
                        );
                      }).toList(),
                      value: result,
                      onChanged: (int value) {
                        setState(() {
                          result = value;
                          print(result);
                          widget.outputValue = value;
                          widget.onChangedFunc(result);
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

class ProfileAvatar extends StatelessWidget{
  final String playerId;

  ProfileAvatar({this.playerId});
  Widget build(BuildContext context){
      var networkImage = new NetworkImage(TennisAiPaths.imagePath(playerId), headers: TennisAiPaths.zumoHeader);
      return new CircleAvatar(
            radius: 36.0,
            backgroundImage: networkImage)
          ;
  }
}

class EditableProfileAvatar extends StatelessWidget{
  final String playerId;
  final String source;
  final VoidCallback onTap;

  EditableProfileAvatar({this.playerId, this.source, this.onTap});
  Widget build(BuildContext context){
      var networkImage = new NetworkImage(TennisAiPaths.imagePath(playerId), headers: TennisAiPaths.zumoHeader);
      return GestureDetector
      (
        onTap: onTap,
        key: TennisAiKeys.profileAvatar(source),
        child:new CircleAvatar(
            radius: 36.0,
            backgroundImage: networkImage)
      );
  }
}