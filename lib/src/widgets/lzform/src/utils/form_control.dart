import 'package:lazyui/src/widgets/lzform/src/notifiers/form_notifier.dart';

class FormControl {
  final FormNotifier notifier;
  FormControl(this.notifier);

  FormControl enable([bool value = true]) {
    notifier.setDisabled(!value);
    return this;
  }

  FormControl value(dynamic value) {
    notifier.controller.text = value.toString();
    return this;
  }

  FormControl extra(dynamic value){
    notifier.extra = value;
    return this;
  }
}