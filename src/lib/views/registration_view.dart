import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class RegistrationView extends StatelessWidget {
  final Settings settings;
  final Function() onRegistrationCancelled;
  final Function(RegistrationInfo registrationInfo) onRegistration;
  RegistrationView(
      {Key key,
      this.settings,
      this.onRegistrationCancelled,
      this.onRegistration})
      : super(key: key);
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();
  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static final GlobalKey<FormFieldState<String>> _firstNameKey =
      new GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> _lastNameKey =
      new GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> _btmNumberKey =
      new GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: new CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final lastName = new TextFormField(
      autofocus: false,
      key: _lastNameKey,
      obscureText: false,
      onSaved: (value) {},
      decoration: InputDecoration(
        hintText: 'Last Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final firstName = new TextFormField(
      autofocus: true,
      obscureText: false,
      key: _firstNameKey,
      decoration: InputDecoration(
        hintText: 'First Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final btmNumber = new TextFormField(
      autofocus: false,
      obscureText: false,
      key: _btmNumberKey,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'BTM Number',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = new Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: new Material(
        // borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.indigoAccent.shade100,
        elevation: 5.0,
        child: new MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              var registrationInfo = new RegistrationInfo(
                  lastName: _lastNameKey.currentState.value,
                  firstName: _firstNameKey.currentState.value,
                  btmNumber: int.parse(_btmNumberKey.currentState.value));
              onRegistration(registrationInfo);
            }
          },
          color: Colors.indigoAccent,
          child: new Text('SAVE', style: new TextStyle(color: Colors.white)),
        ),
      ),
    );

    final forgotLabel = new FlatButton(
      child: new Text(
        'CANCEL',
        style: new TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        onRegistrationCancelled();
        Navigator.of(context).pop();
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: new Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text('Tennis.Ai',
                      style: Theme
                          .of(context)
                          .textTheme
                          .display2
                          .copyWith(color: Colors.indigoAccent)),
                  SizedBox(height: 18.0),
                  new Text("Enter the Player Name and LTA registration number.",
                      style: Theme
                          .of(context)
                          .accentTextTheme
                          .display1
                          .copyWith(fontSize: 18.0, color: Colors.grey)),
                  SizedBox(height: 20.0),
                ]),

            //logo,

            SizedBox(height: 8.0),
            firstName,
            SizedBox(height: 8.0),
            lastName,
            SizedBox(height: 8.0),
            btmNumber,
            SizedBox(height: 28.0),
            loginButton,
            forgotLabel
          ],
        ),
      )),
    );
  }
}
