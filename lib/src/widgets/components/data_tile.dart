part of '../widget.dart';

/// Enum for different text styles applied in [DataTile].
enum TypeStyle {
  /// - [primaryData]: Default style where label and value are shown in standard font sizes.
  primaryData,

  /// - [equalEmphasis]: Style where both label and value have equal visual emphasis.
  equalEmphasis,

  /// - [subtleValue]: Style where the label is bold, and the value is subtle.
  subtleValue
}

/// A widget that displays a label-value pair, typically used to show user biodata or other
/// key-value information in a structured format.
///
/// [DataTile] is designed to be reusable and flexible, allowing different text styles,
/// alignment options, and spacing between the label and value.
///
/// ### Properties:
/// - [label]: The label text to be displayed (e.g., "Name").
/// - [value]: The value associated with the label (e.g., "John Doe").
/// - [align]: Alignment of the label and value, defaults to [CrossAxisAlignment.start].
/// - [gap]: Vertical spacing between label and value, default is 0.
/// - [style]: Controls the typography style for the label and value, default is [TypeStyle.primaryData].
class DataTile extends StatelessWidget {
  /// The label text for the tile, often a descriptor like "Name" or "Date of Birth".
  final String? label;

  /// The value associated with the label, such as "John Doe" for the "Name" label.
  final dynamic value;

  /// Controls the alignment of label and value. Defaults to [CrossAxisAlignment.start].
  final CrossAxisAlignment? align;

  /// Vertical gap between the label and value texts. Defaults to 0.
  final double gap;

  /// The typography style applied to the label and value.
  /// Defaults to [TypeStyle.primaryData].
  final TypeStyle? style;

  /// Creates a [DataTile] widget.
  ///
  /// - [label] is the text descriptor (e.g., "Name") shown above the value.
  /// - [value] is the main data content displayed under the label.
  /// - [align] controls the horizontal alignment of label and value.
  /// - [gap] sets the spacing between label and value.
  /// - [style] customizes the appearance of label and value.
  ///
  /// ### Example
  /// ```dart
  /// Column(
  ///   children: ['Name', 'Date of Birth', 'Gender'].generate((label, i) {
  ///     final values = [Faker.name(), Faker.date(), Faker.gender()];
  ///
  ///     return Container(padding: Ei.sym(v: 13, h: 20), child: DataTile(label: label, value: values[i]));
  ///   }),
  /// ).start
  /// ```
  const DataTile({
    super.key,
    this.label,
    this.value,
    this.align,
    this.gap = 0,
    this.style = TypeStyle.primaryData,
  });

  /// Retrieves the [TextStyle] for the label based on the provided [TypeStyle].
  TextStyle _getLabelStyle(TypeStyle style) {
    switch (style) {
      case TypeStyle.primaryData:
        return Gfont.fs14.muted;
      case TypeStyle.subtleValue:
        return Gfont.bold;
      default:
        return Gfont.normal;
    }
  }

  /// Retrieves the [TextStyle] for the value based on the provided [TypeStyle].
  TextStyle _getValueStyle(TypeStyle style) {
    switch (style) {
      case TypeStyle.primaryData:
        return Gfont.normal;
      default:
        return Gfont.normal;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: align ?? Caa.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label.toString(),
            style: _getLabelStyle(style ?? TypeStyle.primaryData)),
        Text(value.toString(),
            style: _getValueStyle(style ?? TypeStyle.primaryData)),
      ],
    ).gap(gap);
  }
}
