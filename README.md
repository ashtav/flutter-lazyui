# LazyUi

LazyUi is a collection of widgets and utilities designed to simplify and speed up the app development process with Flutter. It's an essential tool for developers seeking cleaner code and quicker results.

> [!IMPORTANT]
> This project is a collection of functions and widgets created based on personal needs with the aim of free customization. There may still be many bugs and shortcomings when used.

## Usage

To use this plugin, add `lazyui` as a [dependency in your pubspec.yaml file](https://flutter.dev/platform-plugins/).

## Get Started
In your `main.dart` file, initialize LazyUi by calling the init method:

```dart
void main() {
    // init lazyui
    LazyUi.init();

    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'App',
            theme: LzTheme.light,
            home: const HomeView()
        );
    }
}
```

This personal project provides documentation in the form of code examples, which can be found in the example section for more information and usage demos.

For more information and examples, see the [example](https://github.com/ashtav/flutter-lazyui/tree/master/example).
