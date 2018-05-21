import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../models/models.dart';
import '../selectors/selectors.dart';
import '../views/registration_view.dart';

class Registration extends StatelessWidget {
  Registration({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, RegistrationViewModel>(
      distinct: true,
      converter: RegistrationViewModel.fromStore, 
      builder: (context, vm){
        return new RegistrationView();
      }
    );
  }
}

class RegistrationViewModel{
  Settings settings;
  RegistrationViewModel({this.settings});
  static RegistrationViewModel fromStore(Store<AppState> store){
      return new RegistrationViewModel(
        settings: settingSelector(store.state).first,
      );
  }
}
