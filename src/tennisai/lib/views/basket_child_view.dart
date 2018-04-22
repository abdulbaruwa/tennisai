import 'package:flutter/material.dart';
import 'package:collection/collection.dart' show lowerBound;
import '../models/models.dart';
import '../controls/usercontrols.dart';

final ThemeData _kTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  accentColor: Colors.redAccent,
);

class BasketChildView extends StatelessWidget {
  final Basket basket;
  final Player player;
  final Function(String) onRemoveFromBasket;
  final List<Tournament> leaveBehindItems;
  final Function(Basket) onSendToLta;

  BasketChildView({Key key, this.basket, this.player, this.onRemoveFromBasket, this.onSendToLta}) : super(key: key);

  Widget buildListTile(BuildContext context, Tournament item) {
    return new MergeSemantics(
      child: new ListTile(
        dense: true,
        leading: new ExcludeSemantics(
            child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              // new Text('Rating', style: new TextStyle(fontSize: 10.0)),
              new CircleAvatar(
                  radius: 16.0,
                  child: new Text(
                    item.grade.toString(),
                    style: Theme.of(context).primaryTextTheme.body1,
                  ))
            ])),
        title: new Text(item.name),
        subtitle: new Text(item.status),
        trailing: new Text('£${item.cost.toString()}'),
      ),
    );
  }

  void handleUndo(Tournament item) {
    final int insertionIndex = lowerBound(leaveBehindItems, item);
    // setState(() {
    //   leaveBehindItems.insert(insertionIndex, item);
    // });
  }

  Widget buildDismisableItem(BuildContext context, BasketItem item) {
    final ThemeData theme = Theme.of(context);
    return new Dismissible(
        key: new ObjectKey(item),
        direction: DismissDirection.horizontal,
        onDismissed: (DismissDirection direction) {
          onRemoveFromBasket(item.code);
        },
        //   setState(() {
        //     leaveBehindItems.remove(item);
        //   });
        //   final String action = (direction == DismissDirection.endToStart)
        //       ? 'archived'
        //       : 'deleted';
        //   _scaffoldKey.currentState.showSnackBar(new SnackBar(
        //       content: new Text('You $action item ${item.name}'),
        //       action: new SnackBarAction(
        //           label: 'UNDO',
        //           onPressed: () {
        //             handleUndo(item);
        //           })));
        // },
        background: new Container(
            color: theme.primaryColor,
            child: const ListTile(
                leading:
                    const Icon(Icons.delete, color: Colors.white, size: 36.0))),
        secondaryBackground: new Container(
            color: theme.primaryColor,
            child: const ListTile(
                trailing: const Icon(Icons.archive,
                    color: Colors.white, size: 36.0))),
        child: new Container(
            decoration: new BoxDecoration(
                color: theme.canvasColor,
                border: new Border(
                    bottom: new BorderSide(color: theme.dividerColor))),
            child: new MergeSemantics(
              child: new ListTile(
                dense: true,
                leading: new ExcludeSemantics(
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      // new Text('Rating', style: new TextStyle(fontSize: 10.0)),
                      new CircleAvatar(
                          radius: 16.0,
                          child: new Text(
                            item.grade.toString(),
                            style: Theme.of(context).primaryTextTheme.body1,
                          ))
                    ])),
                title: new Text(item.tournamentName),
                subtitle: new Text(item.basketStatus ?? 'Unknown Status'),
                trailing: new Text('£${item.cost.toString()}'),
              ),
            )));
  }

  Widget buildTotalRow(BuildContext context, double totalAmount) {
    return new Container(
        color: const Color(0xFFFC5CAE9),
        child: new Row(children: <Widget>[
          new Container(
              alignment: Alignment.topRight,
              child: new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Text('TOTAL',
                      style: Theme.of(context).textTheme.subhead))),
          new Expanded(
              child: new Container(
                  alignment: Alignment.topRight,
                  child: new Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: new Text('£$totalAmount',
                          style: Theme.of(context).textTheme.subhead)))),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    Iterable<Widget> listTiles = basket.basketItems == null ? [] : basket.basketItems.map((BasketItem item) => buildDismisableItem(context, item));
    listTiles = ListTile.divideTiles(context: context, tiles: listTiles);
    return new Column(children: <Widget>[
      new Container(
          padding: const EdgeInsets.all(5.0),
          color: const Color(0xFFFC5CAE9),
          child: new SizedBox(
            height: 76.0,
            child: new Row(children: <Widget>[
              new ProfileAvatar(playerId: player.playerId),
              new Expanded(
                child: new Padding(
                    padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Text('${player.firstName} ${player.lastName}'),
                        new Text('LTA Number: ${player.ltaNumber}'),
                        // new Text('KT21 2XX, Surrey')
                      ],
                    )),
              ),
            ]),
          )),
      //new ListView(),
      new Expanded(
        child: new Scrollbar(
            child: new ListView(
          padding: new EdgeInsets.symmetric(vertical: 4.0),
          children: listTiles.toList(),
        )),
      ),
      new SizedBox(
          height: 86.0,
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildTotalRow(context, basket.totalCost),
                new Expanded(
                    child: new FlatButton(
                        onPressed: () {
                          print('Send to LTA button clicked');
                          onSendToLta(basket);
                        },
                        child: new Text('SEND TO LTA BASKET')))
              ])),
    ]);
  }
}
