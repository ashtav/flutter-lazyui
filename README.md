LazyUi is a collection of widgets and utilities designed to simplify and speed up the app development process with Flutter. Simplifying Flutter development for those who prefer efficiency. Fewer lines, cleaner code, quicker results. The essential tool for the streamlined developer.

## Usage

To use this plugin, add `lazyui` as a [dependency in your pubspec.yaml file](https://flutter.dev/platform-plugins/).


### Example

```dart 

// without LazyUi

Container(
    margin: EdgeInsets.all(15),
    padding: EdgeInsets.symmetric(vertical: 15),
    decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.white)),
        borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Container(
                padding: EdgeInsets.all(15),
                child: Text('Hello!', textAlign: TextAlign.center)
            ),

            Container(
                margin: EdgeInsets.only(right: 15),
                child: Icon(Icons.search)
            )
        ]
    )
)

// with LazyUi

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

### Icons

We use two types of icons such as LineAwesome and TablerIcon. You can use them like this:

```dart
Icon(La.user) // for LineAwesome
Icon(Ti.user) // for TablerIcon
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
    primaryColor: LzColors.dark,
    theme: AppTheme.light,
    widgets: () {
        // If you want to use LzConfirm widget
        LzConfirm.config(cancel: 'Cancel', confirm: 'Yes');
        
        // If you want to use Telegram Bot for error handling
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
    }
);
```

##### Custom Widgets

```dart
Iconr, Textr, Wrapper, BounceScroll, Col, CenterDialog, Intrinsic, InkTouch, Touch,
None, NoScrollGlow, LzNoData, Poslign, LzBox, LzPadder, LzBadge, LzSlidebar, 
LzTextDivider, LzLoader, LzListView, Textml, IntrinsicButton, LzTextField, LzPopover
```


##### Text Style

```dart
Text('hello', style: Gfont.orange.bold.fs(20))
```

##### Shortcuts

```dart
CrossAxisAlignment.end // Caa.end
EdgeInsets.all(15) // Ei.all(15)
FontWeight.bold // Fw.bold
MainAxisSize.min // Mas.min
MainAxisAlignment.start // Maa.start
TextAlign.justify // Ta.justify
TextOverflow.ellipsis // To.ellipsis
TextInputType.number // Tit.number
WrapCrossAlignment.center // Wca.center
WrapAlignment.spaceAround // Wa.spaceAround
```

### LzForm

LzForm is a widget designed to streamline and simplify form creation in Flutter development.

##### LzForm Widget

```dart
final forms = LzForm.make(['name', 'date']);

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
