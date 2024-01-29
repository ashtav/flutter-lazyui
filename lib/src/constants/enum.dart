/// Enum representing different application themes.
///
/// - `light`: Light theme.
/// - `dark`: Dark theme.
/// - `system`: Theme based on the system settings.
enum AppTheme { light, dark, system }

/// Enum representing types of icons used in the application.
///
/// - `lineAwesome`: Icons from the LineAwesome icon set.
/// - `tablerIcon`: Icons from the Tabler icon set.
enum IconType { lineAwesome, tablerIcon }

/// Enum representing the alignment of icons in the application.
///
/// - `left`: Icon aligned to the left.
/// - `right`: Icon aligned to the right.
enum IconAlign { left, right }

/// Enum representing different button types in the application.
///
/// - `primary`: Primary button.
/// - `secondary`: Secondary button.
/// - `danger`: Danger button.
/// - `success`: Success button.
/// - `warning`: Warning button.
/// - `dark`: Dark-themed button.
/// - `white`: White-themed button.
enum ButtonType { primary, secondary, danger, success, warning, dark, white }

/// Enum representing slide directions for animations in the application.
///
/// - `up`: Slide or animation moves upward.
/// - `down`: Slide or animation moves downward.
enum SlideDirection { up, down }

/// Enum representing different positions or alignments in the application.
///
/// - `left`: Left alignment.
/// - `right`: Right alignment.
/// - `top`: Top alignment.
/// - `bottom`: Bottom alignment.
/// - `center`: Center alignment.
enum Position { left, right, top, bottom, center }

/// Enum representing different types of date pickers in the application.
///
/// - `all`: Includes date and time.
/// - `dateTime`: Date and time picker.
/// - `dateMonth`: Date and month picker.
/// - `monthYear`: Month and year picker.
/// - `year`: Year picker.
enum DatePickerType { all, dateTime, dateMonth, monthYear, year }

/// Enum representing types of confirmation dialogs or modals in the application.
///
/// - `dialog`: Confirmation as a dialog box.
/// - `bottomSheet`: Confirmation as a bottom sheet.
enum LzConfirmType { dialog, bottomSheet }

/// Enum representing different types of refresh indicators in the application.
///
/// - `curve`: Curved refresh indicator.
/// - `bar`: Progress bar-based refresh indicator.
/// - `arrow`: Arrow-based refresh indicator.
enum RefrehtorType { curve, bar, arrow }
