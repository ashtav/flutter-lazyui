import 'package:lazyui/lazyui.dart';

class Toasts {
  Toasts show(String text, [ToastGravity gravity = ToastGravity.CENTER]) {
    Fluttertoast.showToast(msg: text, gravity: gravity);
    return this;
  }

  // Toasts info(dynamic message, {bool ok = true, int duration = 2}) {
  //   ok
  //       ? LazyLoading.showInfo(message.toString(), dismissOnTap: true, duration: Duration(seconds: duration))
  //       : LazyLoading.showError(message.toString(), dismissOnTap: true, duration: Duration(seconds: duration));

  //   return this;
  // }

  // Toasts error(dynamic message, [int duration = 2]) {
  //   LazyLoading.showError(message.toString(), dismissOnTap: true, duration: Duration(seconds: duration));
  //   return this;
  // }

  Toasts overlay([String message = 'Loading...']) {
    // LazyLoading.show(maskType: LazyLoadingMaskType.black, status: message);
    return this;
  }

  Toasts dismiss() {
    LazyLoading.dismiss();
    return this;
  }
}

final toast = Toasts();
