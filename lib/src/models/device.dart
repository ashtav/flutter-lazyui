class Device {
  String? brand, model, system, sdk, id;
  Device({this.brand, this.model, this.system, this.sdk, this.id});

  String get value {
    return "Brand: $brand, Model: $model, System: $system, SDK: $sdk, ID: $id";
  }
}
