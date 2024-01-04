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

##### Custom Widgets

```dart
Iconr, Textr, Wrapper, BounceScroll, Columnize, CenterDialog, Intrinsic, InkTouch,
Touch, None, Unglow, LzNoData, Poslign, LzSlideIndicator, LzAccordion, LzButton, 
LzConfirm, LzImage, LzListView, LzTextDivider, LzTextField, LzLoader, Textml, 
AppTrainer
```

##### SelectPicker
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

##### Iconr
```dart
Iconr(La.search, flipX: true, margin: Ei.only(l: 10))
```

##### Textr
```dart
Textr('John Dore', icon: Ti.user)
```


##### Text Style

```dart
Text('hello', style: Gfont.orange.bold.fs(20))
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
