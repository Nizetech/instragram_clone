import 'package:instragram_clone/screens/components/constants/constants.dart';
import 'package:instragram_clone/screens/components/dialog/alert_dialog_model.dart';

class LogoutDialog extends AlertDialogModel<bool> {
  const LogoutDialog()
      : super(title: Strings.logOut, message: Strings.areYouSureYouWantToLogOutOfThisApp, buttons: const {
          Strings.cancel: false,
          Strings.logOut: true,
        });
}
