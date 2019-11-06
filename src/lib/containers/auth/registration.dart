import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:tennisai/actions/actions.dart';
import 'package:tennisai/models/app_state.dart';
import 'package:tennisai/models/registration_info.dart';
import 'package:tennisai/models/settings.dart';
import 'package:tennisai/selectors/selectors.dart';
import 'package:tennisai/views/registration_view.dart';

class Registration extends StatelessWidget {
  Registration({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, RegistrationViewModel>(
      distinct: true,
      converter: RegistrationViewModel.fromStore, 
      builder: (context, vm){
        return new RegistrationView(onRegistrationCancelled: vm.onRegistrationCancelled, onRegistration: vm.onRegister);
      }
    );
  }
}

class RegistrationViewModel{
  Settings settings;
  Function() onRegistrationCancelled;
  Function(RegistrationInfo registerationInfo) onRegister;
  RegistrationViewModel({this.settings, this.onRegistrationCancelled, this.onRegister});
  static RegistrationViewModel fromStore(Store<AppState> store){
    var settings = settingSelector(store.state).first;

      return new RegistrationViewModel(
        settings: settings,
        onRegister: (registrationInfo){
          print('Registering player to a login');
          store.dispatch(new RegistrationSaveAction(registrationInfo));
        }, 
        onRegistrationCancelled: (){
          print('Registration cancelled');

          store.dispatch(new RegistrationCancelledAction());
          store.dispatch(new InitStateAction(settings.playerId));
        }
      );
  }
}
