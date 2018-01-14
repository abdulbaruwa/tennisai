import 'package:flutter/material.dart';
import '../models/models.dart';
import '../keys/keys.dart';
import '../models/enums.dart' as _enums;
typedef OnPlayerProfileSaveCallback = Function(Player player, SearchPreference searchPreference );
final List<int> _distancesInMiles = [10, 30, 50, 100, 200, 500];

final List<int> _ageGroups = [12, 14, 16, 18, 100];

final List<int> _grades = [1, 2, 3, 4, 5, 6];
// class ProfileEditView extends StatelessWidget{
//   static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

//   final bool isEditing;
//   final Player player;
//   final SearchPreference searchPreference;
//   final Function(Player player, SearchPreference searchPreference) onSave;

//   ProfileEditView({Key key, this.onSave, this.isEditing, this.player, this.searchPreference}) : super(key: key ?? TennisAiKeys.editProfile);

//   @override
//   Widget build(BuildContext context){return new Container(child: new Text('Editing profile'));}
// }


// Widget for username editing
class ProfileEditView extends StatelessWidget {
   ProfileEditView({Key key, this.onSave, this.isEditing, this.player, this.searchPreference}) : super(key: key ?? TennisAiKeys.editProfile);
   
  static final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  final bool isEditing;
  final Player player;
  final SearchPreference searchPreference;
  final Function(Player player, SearchPreference searchPreference) onSave;

  int quantity = 0;
  int selectedGender = 0;
  int miles = 30;
  int selectedMiles = 30;
  int selectedGrade = 3;
  int selectedAgeGroup = 18;

  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    var tournamentGroup = new _LabelIntDropDownItem(
        displayIntItems: _ageGroups,
        label: 'Age Group',
        output: selectedAgeGroup,
        displayFunc: (int i) => i < 100 ? 'U$i' : 'Adult');
    //selectedAgeGroup = tournamentGroup.output;
    return new Scaffold(
        // backgroundColor: Colors.white70,
        appBar: new AppBar(title: const Text('Edit Profile'), actions: <Widget>[
          new FlatButton(
              child: new Text('SAVE',
                  style: theme.textTheme.body1.copyWith(color: Colors.white)),
              onPressed: () {
                print('poping with context: ${context.widget.key}');
                Navigator.pop(context, _enums.DismissDialogAction.save);
              })
        ]),
        body: new Form(
            child: new ListView(
          padding: const EdgeInsets.symmetric(horizontal: 1.0),
          children: <Widget>[
            new SizedBox(
              height: 96.0,
              child: new Container(
                  color: Colors.white,
                  child: new Row(
                    children: <Widget>[
                      new CircleAvatar(
                        radius: 36.0,
                        backgroundImage: const AssetImage('images/ademola.jpg'),
                      ),
                      const SizedBox(width: 8.0),
                      new Expanded(
                        child: new Padding(
                            padding: const EdgeInsets.only(
                                left: 2.0, top: 10.0, right: 15.0),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                new TextFormField(
                                  decoration: const InputDecoration(
                                      hintText: 'First name *', isDense: true),
                                  keyboardType: TextInputType.text,
                                ),
                                new TextFormField(
                                  decoration: const InputDecoration(
                                      hintText: 'Last name *', isDense: true),
                                  keyboardType: TextInputType.text,
                                ),
                              ],
                            )),
                      )
                    ],
                  )),
            ),
            // lta info header
            // FFAFAFA
            new Container(
                color: const Color(0xFFF5F5F5),
                padding: const EdgeInsets.all(10.0),
                child: new Text(
                  'LTA INFO',
                  style: theme.textTheme.caption,
                )),
            new _LabelTextFormEdit(
                label: 'LTA Number', inputType: TextInputType.number),

            new Container(
                color: const Color(0xFFF5F5F5),
                padding: const EdgeInsets.all(10.0),
                child: new Text(
                  'ADDRESS',
                  style: theme.textTheme.caption,
                )),
            new _LabelTextFormEdit(label: 'Street Address'),
            new _LabelTextFormEdit(label: 'County'),
            new _LabelTextFormEdit(label: 'Post Code'),

            new Container(
                color: const Color(0xFFF5F5F5),
                padding: const EdgeInsets.all(10.0),
                child: new Text(
                  'TOURNAMENT SEARCH PREFERENCES',
                  style: theme.textTheme.caption,
                )),
            new Container(
                padding: const EdgeInsets.only(top: 5.0, left: 10.0),
                decoration: _topBottomBoxDecoration,
                child: new Column(
                  children: <Widget>[
                    // Gender
                    new _LabelIntDropDownItem(
                        displayIntItems: [0, 1],
                        label: 'Gender',
                        output: selectedGender,
                        displayFunc: (int i) => i == 0 ? 'Female' : 'Male'),
                    // Miles from home
                    new _LabelIntDropDownItem(
                        displayIntItems: _distancesInMiles,
                        label: 'Distance',
                        output: selectedMiles,
                        displayFunc: (int i) => '$i miles'),
                    //  tournament Grade
                    new _LabelIntDropDownItem(
                        displayIntItems: _grades,
                        label: 'Grade',
                        output: selectedGrade,
                        displayFunc: (int i) => 'Grade $i'),
                    //  tournament group
                    tournamentGroup,
                  ],
                )),
          ],
        )));
  }
}

final BoxDecoration _topBottomBoxDecoration = new BoxDecoration(
  border: new Border(
    bottom: const BorderSide(color: const Color(0xFFD9D9D9)),
    top: const BorderSide(color: const Color(0xFFD9D9D9)),
  ),
);

class _LabelTextFormEdit extends StatefulWidget {
  _LabelTextFormEdit({Key key, this.label, this.inputType}) : super(key: key);
  String label;
  TextInputType inputType = TextInputType.text;

  @override
  _LabelTextFormEditState createState() => new _LabelTextFormEditState();
}

class _LabelTextFormEditState extends State<_LabelTextFormEdit> {
  @override
  void initState() {
    super.initState();
    //result = widget.output;
  }

  Widget build(BuildContext context) {
    return new Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 0.0, left: 10.0),
        child: new Column(
          children: [
            new Row(
              children: <Widget>[
                new Text(widget.label),
                new Expanded(
                    child: new Container(
                        padding: const EdgeInsets.only(right: 5.0, left: 10.0),
                        alignment: Alignment.bottomRight,
                        child: new TextField(
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.end
                        )))
              ],
            )
          ],
        ));
  }
}

// Used to create a Row with Label and Selectable drop down
class _LabelIntDropDownItem extends StatefulWidget {
  _LabelIntDropDownItem(
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
  _LabelIntDropDownItemState createState() => new _LabelIntDropDownItemState();
}

//  State for Row with Label and Selectable drop down
class _LabelIntDropDownItemState extends State<_LabelIntDropDownItem> {
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
