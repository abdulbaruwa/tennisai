import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../models/models.dart';
import '../selectors/selectors.dart';
import '../views/dashboard_view.dart';
import '../keys/keys.dart';
import '../views/loading_indicator.dart';

class AppLoading extends StatelessWidget {
  //final Function(BuildContext context, bool isLoading) builder;
  final Function(BuildContext context, AppLoadViewModel vm) builder;
  AppLoading({Key key, @required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, AppLoadViewModel>(
      distinct: true,
      converter: AppLoadViewModel.fromStore, 
      builder: builder,
    );
  }
}

class AppLoadViewModel{
  bool isLoading;
  bool isSignedIn;

  AppLoadViewModel({this.isLoading, this.isSignedIn});
  static AppLoadViewModel fromStore(Store<AppState> store){
      return new AppLoadViewModel(
        isLoading: isLoadingSelector(store.state),
        isSignedIn: isLoadingSelector(store.state)
      );
  }
}
