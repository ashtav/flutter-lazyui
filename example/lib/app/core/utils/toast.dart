import 'package:lazyui/lazyui.dart';

class Toasts {
  Toasts show(String text, [ToastGravity gravity = ToastGravity.CENTER]) {
    Fluttertoast.showToast(msg: text, gravity: gravity);
    return this;
  }

  Toasts info(dynamic message, {bool ok = true, int duration = 2}) {
    ok
        ? EasyLoading.showInfo(message.toString(), dismissOnTap: true, duration: Duration(seconds: duration))
        : EasyLoading.showError(message.toString(), dismissOnTap: true, duration: Duration(seconds: duration));

    return this;
  }

  Toasts error(dynamic message, [int duration = 2]) {
    EasyLoading.showError(message.toString(), dismissOnTap: true, duration: Duration(seconds: duration));
    return this;
  }

  Toasts overlay([String message = 'Loading...']) {
    EasyLoading.show(maskType: EasyLoadingMaskType.black, status: message);
    return this;
  }

  Toasts dismiss() {
    EasyLoading.dismiss();
    return this;
  }
}

final toast = Toasts();
