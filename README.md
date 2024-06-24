LazyUi is a collection of widgets and utilities designed to simplify and speed up the app development process with Flutter. Simplifying Flutter development for those who prefer efficiency. Fewer lines, cleaner code, quicker results. The essential tool for the streamlined developer.

## Usage

To use this plugin, add `lazyui` as a [dependency in your pubspec.yaml file](https://flutter.dev/platform-plugins/).


### Get Started
In your `main.dart` file, , initialize LazyUi by calling the init method:

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


For more information and examples, see the [example](https://github.com/ashtav/flutter-lazyui/tree/master/example).