LazyUi is a collection of widgets and utilities designed to simplify and speed up the app development process with Flutter. Simplifying Flutter development for those who prefer efficiency. Fewer lines, cleaner code, quicker results. The essential tool for the streamlined developer.

## Usage

To use this plugin, add `lazyui` as a [dependency in your pubspec.yaml file](https://flutter.dev/platform-plugins/).

## Table of Contents
- [Get Started](#get-started)
- [Extensions](#extensions)
  - [Context](#context)
  - [Number](#number)
    

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


## Extensions
LazyUI provides a set of extension methods to simplify common tasks within your Flutter application. These extensions enhance code readability and maintainability by offering concise ways to interact with the context and manipulate numbers.

### context
```dart
    // navigation
    context.lz.push(const Page());
    context.lz.pop();

    // dialog, bottom sheet
    context.dialog(const Widget());
    context.bottomSheet(const Widget());

    // size
    context.width;
    context.height;
```
For more information and examples, [context](https://github.com/ashtav/flutter-lazyui/blob/dev-4.0.0/lib/src/extensions/context.dart)

### number
```dart
    100.ms; // Duration(milliseconds: 100);
    5.s; // Duration(seconds: 1);
```


For more information and examples, see the [example](https://github.com/ashtav/flutter-lazyui/tree/master/example).