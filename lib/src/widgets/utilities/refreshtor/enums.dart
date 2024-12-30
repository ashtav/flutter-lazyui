/// Defines the trigger for the pull-to-refresh gesture.
enum IndicatorTrigger {
  leadingEdge, // Trigger refresh from the leading edge (top or bottom).
  trailingEdge, // Trigger refresh from the trailing edge (bottom or top).
  bothEdges, // Trigger refresh from both edges of the list.
}

/// Configures how the refresh indicator can be triggered.
enum TriggerMode {
  anywhere, // Trigger indicator regardless of scroll position.
  onEdge, // Trigger indicator only when at the edge.
}

enum IndicatorEdge {
  leading, // Leading edge (top or left).
  trailing, // Trailing edge (bottom or right).
}

enum IndicatorSide {
  left, // Left side.
  top, // Top side.
  right, // Right side.
  bottom, // Bottom side.
  none, // No side.
}
