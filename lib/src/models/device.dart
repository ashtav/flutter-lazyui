/// A class representing a device with brand, model, system, SDK, and ID information.
class Device {
  /// The brand of the device.
  String? brand;

  /// The model of the device.
  String? model;

  /// The system of the device.
  String? system;

  /// The SDK version of the device.
  String? sdk;

  /// The ID of the device.
  String? id;

  /// Constructs a [Device] instance with the provided information.
  ///
  /// [brand]: The brand of the device.
  /// [model]: The model of the device.
  /// [system]: The system of the device.
  /// [sdk]: The SDK version of the device.
  /// [id]: The ID of the device.
  Device({this.brand, this.model, this.system, this.sdk, this.id});

  /// Gets a formatted string representing the value of the device.
  ///
  /// Returns a formatted string containing the brand, model, system, SDK, and ID of the device.
  String get value {
    return "Brand: $brand, Model: $model, System: $system, SDK: $sdk, ID: $id";
  }
}
