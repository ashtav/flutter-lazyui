/// Check path validation
bool isValidPath(String path) {
  // check if path has invalid separator usage
  bool hasInvalidSeparatorUsage = path.contains('//') || path.contains('\\\\');

  // check if path has valid extension
  bool hasValidExtension = path.contains(RegExp(r'\.[a-zA-Z0-9]+$'));

  // check if path has valid characters
  bool hasValidCharacters = !RegExp(r'[<>:"|?*]').hasMatch(path);

  // return result
  return !hasInvalidSeparatorUsage && hasValidExtension && hasValidCharacters;
}
