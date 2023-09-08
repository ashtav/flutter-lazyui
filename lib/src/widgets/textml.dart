part of widget;

/// `Textml` is a Flutter widget for rendering rich text with custom formatting. It allows you to define text styles, alignment, text direction, and supports basic HTML-like formatting tags such as `b`, `i`, `u`, and `color`.
///
/// Example usage:
/// ```dart
/// Textml(
///   'This is <b>bold</b> and <i>italic</i> text with <u>underline</u> and <color="FF5733">custom color</color>.',
///   style: TextStyle(fontSize: 16, color: Colors.black),
///   textAlign: TextAlign.center,
///   textDirection: TextDirection.ltr,
///   overflow: TextOverflow.ellipsis,
/// )
/// ```
class Textml extends StatelessWidget {
  /// The text to be displayed with custom formatting.
  final String text;

  /// Optional text style for the rendered text.
  final TextStyle? style;

  /// Optional alignment for the text within its parent container.
  final TextAlign? textAlign;

  /// Optional text direction for the text.
  final TextDirection? textDirection;

  /// Optional text overflow behavior.
  final TextOverflow? overflow;

  const Textml(this.text,
      {Key? key, this.style, this.textAlign, this.textDirection, this.overflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.bodyMedium;

    return RichText(
      textAlign: textAlign ?? TextAlign.start,
      textDirection: textDirection,
      overflow: overflow ?? TextOverflow.clip,
      text: TextSpan(
        style: style ?? textStyle,
        children: parseText(text, style: style ?? textStyle),
      ),
    );
  }

  List<TextSpan> parseText(String text, {TextStyle? style}) {
    final regex =
        RegExp(r'<(\w+)(?: color="([0-9a-fA-F]{3,6})")?>(.*?)<\/\1>|([^<]+)');
    final matches = regex.allMatches(text);

    final textSpans = <TextSpan>[];
    for (final match in matches) {
      final type = match.group(1);
      final color = match.group(2);
      String content = match.group(3) ?? match.group(4) ?? '';

      TextStyle updatedStyle = style ?? const TextStyle();
      if (type == 'b') {
        updatedStyle = updatedStyle.copyWith(fontWeight: FontWeight.bold);
      } else if (type == 'i') {
        updatedStyle = updatedStyle.copyWith(fontStyle: FontStyle.italic);
      } else if (type == 'u') {
        updatedStyle =
            updatedStyle.copyWith(decoration: TextDecoration.underline);
      }

      if (color != null) {
        updatedStyle = updatedStyle.copyWith(color: Utils.hex(color));
      }

      if (content.contains('<') && content.contains('>')) {
        List<TextSpan> nestedContent = parseText(content, style: updatedStyle);
        textSpans.addAll(nestedContent);
      } else {
        textSpans.add(TextSpan(text: content, style: updatedStyle));
      }
    }

    return textSpans;
  }
}
