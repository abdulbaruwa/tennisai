import 'package:flutter/material.dart';
import '../keys/keys.dart';
import '../models/models.dart';

class PhotoProfileView extends StatelessWidget {
  final Player player;
  const PhotoProfileView({Key key, this.player}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new SizedBox(
        height: 76.0,
        child: new Row(children: <Widget>[
          new CircleAvatar(
            radius: 36.0,
            backgroundImage: const AssetImage('images/ademola.jpg'),
          ),
          const SizedBox(width: 8.0),
          new Expanded(
            child: new Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Text(
                      player != null ? '${player.firstName} ${player.lastName}': '',
                      key: TennisAiKeys.profileName,
                      style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
                    ),
                    new Text(player != null ? player.address: '?'),
                    new Text(player.postCode != null ? player.postCode : '?')
                  ],
                )),
          ),
        ]));
  }
}
