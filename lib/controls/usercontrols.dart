import 'package:flutter/material.dart';

class LabelIntDropDownItem extends StatefulWidget {
  LabelIntDropDownItem(
      {Key key,
      this.displayFunc,
      this.displayIntItems,
      this.label,
      this.output})
      : super(key: key);
  var displayFunc;
  final label;
  List<int> displayIntItems;
  int output;

  @override
  LabelIntDropDownItemState createState() => new LabelIntDropDownItemState();
}

//  State for Row with Label and Selectable drop down
class LabelIntDropDownItemState extends State<LabelIntDropDownItem> {
  int result;
  @override
  void initState() {
    super.initState();
    result = widget.output;
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
                          child: new Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: new Text(widget.displayFunc(value)),
                          ),
                        );
                      }).toList(),
                      value: result,
                      onChanged: (int value) {
                        setState(() {
                          print(value);
                          result = value;
                          print(widget.output);
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