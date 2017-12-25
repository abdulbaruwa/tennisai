import 'package:flutter/material.dart';

final ThemeData _kTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  accentColor: Colors.redAccent,
);

final BoxDecoration _underlineBoxDecoration = new BoxDecoration(
  border: new Border(
    bottom: const BorderSide(color: const Color(0xFFD9D9D9)),
  ),
);

final BoxDecoration _topBottomBoxDecoration = new BoxDecoration(
  border: new Border(
    bottom: const BorderSide(color: const Color(0xFFD9D9D9)),
    top: const BorderSide(color: const Color(0xFFD9D9D9)),
  ),
);

final List<int> _distancesInMiles = [10, 30, 50, 100, 200, 500];

final List<int> _ageGroups = [12, 14, 16, 18, 100];

final List<int> _grades = [1, 2, 3, 4, 5, 6];

enum DismissDialogAction {
  cancel,
  discard,
  save,
}

class SettingsTab extends StatefulWidget {
  SettingsTab({Key key}) : super(key: key);
  @override
  SettingsTabState createState() => new SettingsTabState();
}

class SettingsTabState extends State<SettingsTab> {
  static final GlobalKey<ScaffoldState> scaffoldKey =
      new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: _kTheme.copyWith(platform: Theme.of(context).platform),
        child: new Scaffold(
            key: scaffoldKey,
            floatingActionButton: new FloatingActionButton(
              child: const Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute<DismissDialogAction>(
                      builder: (BuildContext context) => new UserProfileEdit(),
                      fullscreenDialog: true,
                    ));

                // scaffoldKey.currentState.showSnackBar(const SnackBar(
                //   content: const Text('Not supported.'),
                // ));
              },
            ),
            body: new Container(
                child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new _ProfileSection(),
                new Icon(Icons.search, size: 150.0, color: Colors.black12),
                new Text('Profile & Settings tab content')
              ],
            ))));
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => new Container(
      color: Colors.amber,
      child: new SizedBox(
          height: 105.0,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Padding(
                  padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                  child: new _UserProfile()),
            ],
          )));
}

// Displays the Vendor's name and avatar.
class _UserProfile extends StatelessWidget {
  const _UserProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      height: 96.0,
      child: new Row(
        children: <Widget>[
          new CircleAvatar(
            radius: 36.0,
            backgroundImage: const AssetImage('images/ademola.jpg'),
          ),
          const SizedBox(width: 8.0),
          new Expanded(
            child: new Padding(
                padding: const EdgeInsets.only(left: 2.0, top: 25.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Text('Ademola Baruwa'),
                    new Text('66 West Farm Avenue')
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class UserProfileEdit extends StatefulWidget {
  UserProfileEdit({Key key}) : super(key: key);
  @override
  UserProfileEditState createState() => new UserProfileEditState();
}

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
                        child: new TextFormField(
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.end,
                        )))
              ],
            )
          ],
        ));
  }
}

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

class UserProfileEditState extends State<UserProfileEdit> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();
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
                Navigator.pop(context, DismissDialogAction.save);
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
                child: new Text('LTA INFO', style: theme.textTheme.caption,)),
            new _LabelTextFormEdit(label: 'LTA Number', inputType: TextInputType.number),

             new Container(
              color: const Color(0xFFF5F5F5),
                padding: const EdgeInsets.all(10.0),
                child: new Text('ADDRESS', style: theme.textTheme.caption,)),
            new _LabelTextFormEdit(label: 'Street Address'),
            new _LabelTextFormEdit(label: 'County'),
            new _LabelTextFormEdit(label: 'Post Code'),
     
         new Container(
              color: const Color(0xFFF5F5F5),
                padding: const EdgeInsets.all(10.0),
                child: new Text('TOURNAMENT SEARCH PREFERENCES', style: theme.textTheme.caption,)),
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
