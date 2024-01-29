/// An enumeration of the different notifier styles for forms in the LZ framework.
///
/// Defines how the notifier should be presented in response to form interactions.
///
/// - `none`: Indicates no notifier should be displayed.
/// - `toast`: A brief message displayed in a small popup at the bottom of the screen.
/// - `text`: A text message displayed inline, typically near the form element.
enum LzFormNotifier { none, toast, text }

/// Enumerates the styling options for sublabels in form elements.
///
/// This is used to define the appearance of additional descriptive text or indicators associated with form fields.
///
/// - `text`: Simple text-based sublabel.
/// - `card`: Sublabel presented within a card-like container.
/// - `cardWarning`: Similar to `card`, but styled to indicate a warning or important note.
enum SublabelStyle { text, card, cardWarning }

/// Represents the different layout styles for forms.
///
/// This enumeration is used to specify how the form fields are aligned and grouped in the UI.
///
/// - `topAligned`: Fields are aligned at the top of the form.
/// - `topInner`: Fields are aligned at the top but within an inner container or section.
/// - `grouped`: Fields are grouped together, typically in sections.
/// - `underlined`: Each form field is underlined, creating a clear division between fields.
enum FormType { topAligned, topInner, grouped, underlined }
