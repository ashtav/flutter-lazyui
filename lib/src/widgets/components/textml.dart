part of '../widget.dart';

/// `Textml` is a Flutter widget for rendering rich text with custom formatting. It allows you to define text styles, alignment, text direction, and supports basic HTML-like formatting tags such as `b`, `i`, `u`, and `color`.
///
/// Example usage:
/// ```dart
/// Textml(
///   'This is <b>bold</b> and <i>italic</i> text with <u>underline</u> and <p color="FF5733">custom color</p>.',
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

  /// ```dart
  /// // Example usage:
  /// Textml(
  ///   'This is <b>bold</b> and <i>italic</i> text with <u>underline</u> and <p color="FF5733">custom color</p>.',
  ///   style: TextStyle(fontSize: 16, color: Colors.black),
  ///   textAlign: TextAlign.center,
  ///   textDirection: TextDirection.ltr,
  ///   overflow: TextOverflow.ellipsis,
  /// )
  /// ```
  const Textml(this.text,
      {super.key,
      this.style,
      this.textAlign,
      this.textDirection,
      this.overflow});

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

  /// Parses a given text containing custom markup and returns a list of [TextSpan] objects
  /// that represent styled text based on the markup tags.
  ///
  /// The function takes a [text] input string and an optional [style] parameter to apply
  /// default text styling to the entire text if not specified otherwise within the markup.
  ///
  /// The supported markup tags include:
  /// - `<b>`: Bolds the enclosed text.
  /// - `<i>`: Italicizes the enclosed text.
  /// - `<u>`: Underlines the enclosed text.
  /// - `<p color="#RRGGBB">`: Sets the text color using a hexadecimal color code.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final textWithMarkup = 'This is <b>bold</b> and <p color="#FF5733">colored</p> text.';
  /// final textSpans = parseText(textWithMarkup);
  /// ```
  ///
  /// Returns a list of [TextSpan] objects representing the stylized text.

  List<TextSpan> parseText(String text, {TextStyle? style}) {
    final regex = RegExp(
        r'<(\w+)(?: color="([0-9a-fA-F]{3,6})")?>(.*?)<\/\1>|<br\s*\/?>|([^<]+)');
    final matches = regex.allMatches(text);

    final textSpans = <TextSpan>[];
    for (final match in matches) {
      final type = match.group(1);
      final color = match.group(2);
      String content = match.group(3) ?? match.group(4) ?? '';

      TextStyle updatedStyle = style ?? const TextStyle();
      if (type == 'b' || type == 'strong') {
        updatedStyle = updatedStyle.copyWith(fontWeight: FontWeight.bold);
      } else if (type == 'i' || type == 'em') {
        updatedStyle = updatedStyle.copyWith(fontStyle: FontStyle.italic);
      } else if (type == 'u') {
        updatedStyle =
            updatedStyle.copyWith(decoration: TextDecoration.underline);
      } else if (type == 'del') {
        updatedStyle =
            updatedStyle.copyWith(decoration: TextDecoration.lineThrough);
      } else if (type == 'mark') {
        updatedStyle = updatedStyle.copyWith(
            backgroundColor: Colors.yellow); // Highlight effect
      }

      if (color != null) {
        updatedStyle = updatedStyle.copyWith(color: Utils.hex(color));
      }

      // Handle <br> for line breaks
      // Handle self-closing <br> tags
      if (match.group(0)?.contains('<br') ?? false) {
        textSpans.add(const TextSpan(text: '\n'));
        continue;
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
