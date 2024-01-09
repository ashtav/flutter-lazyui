LazyUi is a collection of widgets and utilities designed to simplify and speed up the app development process with Flutter. Simplifying Flutter development for those who prefer efficiency. Fewer lines, cleaner code, quicker results. The essential tool for the streamlined developer.

## Usage

To use this plugin, add `lazyui` as a [dependency in your pubspec.yaml file](https://flutter.dev/platform-plugins/).

### Features

- [Shortcut](#shortcut)
- [Icons](#icons)
- [Custom Extension](#custom-extension)
- [Custom Widget](#custom-widget)
- [Form](#lzform)


### Shortcut

```dart 

Container(
    margin: Ei.all(15),
    padding: Ei.sym(v: 15),
    decoration: BoxDecoration(
        border: Br.only(['t'], color: Colors.white),
        borderRadius: Br.radius(5)
    ),
    child: Column(
        crossAxisAlignment: Caa.start,
        mainAxisAlignment: Maa.center,
        children: [
            Textr('Hello!', textAlign: Ta.center, padding: Ei.all(15)),
            Iconr(Icons.search, margin: Ei.only(r: 15))
        ]
    )
)

```

``` dart
CrossAxisAlignment.end // Caa.end
EdgeInsets.all(15) // Ei.all(15)
FontWeight.bold // Fw.bold
MainAxisSize.min // Mas.min
MainAxisAlignment.start // Maa.start
TextAlign.justify // Ta.justify
TextOverflow.ellipsis // Tof.ellipsis
TextInputType.number // Tit.number
WrapCrossAlignment.center // Wca.center
WrapAlignment.spaceAround // Wa.spaceAround
```

### Icons

We use two types of icons such as LineAwesome and TablerIcon. You can use them like this:

```dart
Icon(La.user) // for LineAwesome
Icon(Ti.user) // for TablerIcon (v2.36.0)
```

### Custom Extension

We've designed Custom Extensions in LazyUi to simplify and enhance your Flutter coding experience, making common tasks more efficient and intuitive.

##### Color
```dart

Colors color = Colors.blue;

color.lighten(.3); // lighten color by 30%
color.darken(.3); // darken color by 30%
color.inverse(); // inverse color
color.isDark(); // check if color is dark
```

##### Date Time
```dart
const date = DateTime.now();

date.format('yyyy-MM-dd HH:mm:ss'); // format date
date.weekOfMonth; // get week of month
date.weekOfYear; // get week of year
```

##### Duration
```dart
Timer(1.s, () => print('1 second later')); // 1 second
// You can use .ms, .s, .m, .h, .d, .w, .M, .y
```

##### Manipulate String
```dart
String name = 'john doe 94';

name.ucfirst(); // convert first letter to uppercase
name.ucwords(); // convert first letter of each word to uppercase
name.initials(length = 2); // get initials, it will return jd

"2023-03-03 00:00:00".toDate(); // convert string to DateTime

```

##### Manipulate Map
```dart
Map<String, dynamic> item = {
    'name': 'Apple',
    'price': '$1.00'
};

item.add({'qty': 5}) // add new key-value pair
item.removes(['price']) // remove key-value pair
item.get(['name']) // get specific data, it will return {'name': 'Apple'}
item.renameKey({'name': 'item_name'}) // rename key, from name to item_name

item.numeric(['price']) // convert to numeric, it will return price as double
item.ucfirst(['name']) // convert first letter to uppercase
item.ucwords(['name']) // convert first letter of each word to uppercase
item.lowers(['name']) // convert to lowercase
item.uppers(['name']) // convert to uppercase
item.currency(['price'], prefix: 'Rp', locale: 'id_ID') // convert to currency, it will return Rp1.000,00
```

### Custom Widget

LazyUi's Custom Widgets are pre-built components designed to simplify your UI development process in Flutter, providing efficient and visually appealing solutions to common design challenges.

##### LazyConfig


```dart
// Put this code in your main.dart file after, WidgetsFlutterBinding.ensureInitialized();

LazyUi.config(
    radius: 5, // default radius for LazyUi custom widgets
    theme: AppTheme.light
);

Errors.config(
    botToken: '<bot_token>',
    chatId: '<chat_id>',
    useBot: true, // if false, error will be printed in console only
    errorBuilder: (ErrorInfo info) {
        // Here you can customize your error message

        String message = 'This is custom error message: ${info.error}, ${info.device}';
        Bot.sendMessage(message, info.botToken!, info.chatId!);
    }
);
```

#### Custom Widgets

[Iconr](#iconr), [Textr](#textr), [Wrapper](#wrapper), [CenterDialog](#centerdialog), [Intrinsic](#intrinsic), [InkTouch](#inktouch), [Touch](#touch), [LzNoData](#lznodata), [Poslign](#poslign), [LzSlideIndicator](#lzslideindicator), [LzAccordion](#lzaccordion), [LzButton](#lzbutton), [LzConfirm](#lzconfirm), [LzImage](#lzimage), [LzListView](#lzlistview), [LzTextDivider](#lztextdivider), [LzTextField](#lztextfield), [LzLoader](#lzloader), [Textml](#textml), [AppTrainer](#apptrainer), [LzOtp](#lzotp), [SelectPicker](#selectpicker)

#### Iconr
```dart
Iconr(La.search, flipX: true, margin: Ei.only(l: 10))
```

#### Textr
```dart
Textr('John Dore', icon: Ti.user)
```

#### Wrapper
Wrapped is designed to wrap around various widgets in Flutter. It can be used on form pages to unfocus text fields, or to handle back press actions effectively.

```dart
Wrapper(
    onBackPress: () {},
    child: Scaffold()
)
```

#### CenterDialog
CenterDialog is used to display a dialog-like content centered within the screen.

```dart
context.dialog(CenterDialog(child: YourWidget()));
```

#### Intrinsic
The Intrinsic widget provides an easier way to create an intrinsic height layout for a list of children. It simplifies the process of ensuring that all children have the same height based on the tallest child in either a horizontal or vertical layout.

```dart
Intrinsic(
    children: [
        Expanded(child: Text('Child 1')),
        Expanded(child: Text('Child 2')),
    ]
)
```

#### InkTouch
The InkTouch widget simplifies the usage of InkWell by providing parameters to configure its appearance and behavior easily.

```dart
InkTouch(
    onTap: () { },
    padding: Ei.sym(v: 13, h: 20),
    child: Text('Tap Me'),
)
```

#### Touch
Touch is a convenient Flutter widget that simplifies the use of `GestureDetector`
with translucent behavior.

```dart
Touch(
    onTap: () {}
    child: YourWidget(),
)
```

#### LzNoData
LzNoData is a Flutter widget that displays a message when there is no data to show. It provides customization options for the message, icon, and tap-to-refresh functionality.

```dart
LzNoData(
    message: 'No data available',
    onTap: () { },
)
```

#### Poslign
Poslign is a Flutter widget that allows precise control over the positioning and alignment of its child widget within a container. It combines the power of Positioned, IgnorePointer, Align, and Container widgets to achieve this.

```dart
Stack(
    children: [
        Poslign(
            alignment: Alignment.center,
            child: YourWidget(),
        )
    ]
)
```

#### LzSlideIndicator
LzSlideIndicator is a Flutter widget used to display a row of indicators typically used for indicating the current page or position within a set of items or slides. It allows customization of the appearance and behavior of the indicators.

```dart
LzSlideIndicator(
    length: 5,
    active: 2,
    size: (index) => [10, 10],
    activeColor: Colors.blue
)
```

#### LzAccordion
LzAccordion is a customizable Flutter widget that creates an accordion-style UI component with expandable content sections. It allows you to specify a list of sections, each with a title and content.

```dart
LzAccordion(
  children: [
    LzAccordionContent(
      title: 'Section 1',
      child: Text('Content for Section 1'),
    ),
    LzAccordionContent(
      title: 'Section 2',
      child: Text('Content for Section 2'),
    ),
  ]
)
```

#### LzButton
The LzButton widget allows you to create customizable buttons with different styles and configurations. You can set text, icons, colors, and more to tailor the button's appearance and behavior to your needs.

```dart
LzButton(
    text: 'Click Me',
    onTap: (state) {
        // state.submit(); // to show loading animation
        // state.abort(); // to stop
    }
)
```

#### LzConfirm
The LzConfirm widget allows you to create customizable confirmation dialogs with options to display an icon, title, message, and buttons for confirmation and cancellation.

```dart
LzConfirm(
    title: 'Are you sure?',
    message: 'This action cannot be undone.',
    onConfirm: () { },
)
```

#### LzImage
The LzImage widget provides flexibility in displaying images by supporting
different data types such as `String`, `File`, `Uint8List`, and more. It allows
you to customize the image's appearance, including its fit, size, radius, color,
and placeholders for loading and error states.

```dart
LzImage(
  image: 'https://example.com/image.jpg',
  radius: 10,
)
```

#### LzListView
LzListView is a versatile Flutter widget that simplifies the creation of scrollable lists with various features such as scroll limits, custom scroll controllers, and automatic caching.
It allows you to quickly create scrollable lists of child widgets and provides options for customizing the scrolling behavior and appearance.

```dart
LzListView(
  autoCache: true, // Whether to automatically cache the list height.
  scrollLimit: [100.0, 500.0], // To restrict scrolling within a range.
  onScroll: (controller) {
    // Callback when the list is scrolled.
  },
  children: [Widget1(), Widget2(), ...], // List of child widgets.
)
```

#### LzTextDivider
LzTextDivider is a Flutter widget that displays a line of text with a divider line underneath it. It provides customization options for text, spacing, height, line height, background color, and line color.

```dart
LzTextDivider(
  Text('Divider Text'), // Text to display.
  spacing: 15, // Spacing between text and divider line.
  height: 30, // Height of the entire widget.
  lineHeight: 1, // Height of the divider line.
  backgroundColor: Colors.grey[200], // Background color of the widget.
  lineColor: Colors.grey, // Color of the divider line.
)
```

#### LzTextField
LzTextField is a customizable Flutter widget that simplifies the creation of text input fields with various features such as keyboard type, input actions, character limits, and more.

```dart
LzTextField(
  hint: 'Enter your text...',
  onSubmit: (text) {
    // Callback when the user submits the text.
  }
)
```

#### LzLoader
LzLoader is a versatile Flutter widget that provides a loading indicator. It can be customized by specifying the size, stroke width, margin, and color.

```dart
LzLoader(
  size: 18, // The size of the loading indicator.
  stroke: 2, // The width of the loading indicator stroke.
  color: Colors.blue, // Optional color for the loading indicator.
)

LzLoader.bar(message: 'Loading...')
```

#### Textml
Textml is a Flutter widget for rendering rich text with custom formatting. It allows you to define text styles, alignment, text direction, and supports basic HTML-like formatting tags such as `b`, `i`, `u`, and `color`.

```dart
Textml('This is <b>bold</b> and <i>italic</i> text with <u>underline</u> and <p color="FF5733">custom color</p>.',
    style: TextStyle(fontSize: 16, color: Colors.black),
)
```

#### AppTrainer
AppTrainer is a Flutter widget that helps guide users through your app by highlighting specific UI elements and providing step-by-step instructions.

```dart
AppTrainer(
  child: MyApp(),
  targets: [
    Target(
      key: 'buttonKey',
      targetRect: Rect.fromCircle(center: Offset(100, 100), radius: 20),
      title: 'Welcome to My App!',
      description: 'Tap this button to get started.',
    ),
    // Add more targets here
  ],
  onInit: (controller) {
    // Initialize the controller and start the tutorial.
    controller.start();
  },
  onFinish: () {
    // Handle when the user completes the tutorial.
  },
)
```

#### LzOtp
This widget provides an interface for entering a numeric OTP typically used for authentication purposes. It supports custom expiration times, various OTP styles, and a completion callback.

```dart
LzOtp.show(context,
  expired: 60.s,
  type: OtpType.bottomLine,
  subtitle: 'OTP code sent to +628100000, please enter the code below to reset your password',
  onCompleted: (otp) {
    String value = otp.value;
    // request api to verify otp
  });
```

#### SelectPicker
```dart
GestureDetector(
    onTap: (){
        SelectPicker.show(context,
            maxLines: 2,
            withSearch: true,
            height: context.height / 2,
            options: 10.generate((item) => Faker.address()).options(),
            onSelect: (o) { }
        );
    },
)
```


#### Text Style

```dart
Text('hello', style: Gfont.orange.bold.fs(20))
```

### LzForm

LzForm is a widget designed to streamline and simplify form creation in Flutter development.

##### LzForm Widget

```dart
final forms = LzForm.make(['name', 'date', 'gender']);

ListView(
    children: [
        LzForm.input(label: 'Name', hint: 'Type your name', model: forms['name']),
        LzForm.input(label: 'Date', hint: 'Input date', model: forms['date'], onTap: (model){
            LzPicker.datePicker(context).then((value) {
                if (value != null) {
                    model.text = value.format('dd-MM-yyyy');
                }
            });

            // Or you can use your favorite datepicker
        }),

        LzForm.radio(
            label: 'Select Gender *',
            options: ['Male', 'Female'].options(),
            model: forms['gender']),

        LzForm.select(
            label: 'City *',
            hint: 'Please select city',
            model: forms['city'],
            options: ['A', 'B', 'C', 'D', 'E', 'F'].options(),
        )

        // You can explore other methods in LzForm, such as .radio, .select, and so on.
    ]
)
```

##### LzForm Validation

```dart

LzButton(
    text: 'Submit',
    onTap: (state) {
        final form = forms.validate(required: ['*'], min: ['name:5'], message: FormMessages(
            required: {
                'name': 'Your name is required'
            },
            min: {
                'name': 'Name must be at least 5 characters'
            }
        ));

        if(form.ok){
            state.submit(text: 'Submitting...'); // set loading to button
            final payload = form.value;

            // do request api...
            // state.abort();
        }
    }
)

```


For more information and examples, see the [example](https://github.com/ashtav/flutter-lazyui/tree/master/example).
