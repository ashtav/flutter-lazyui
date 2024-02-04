import 'package:example/app/screens/widgets/loader_view.dart';
import 'package:example/app/screens/widgets/nodata_view.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'test_view.dart';

class CustomWidgetView extends StatelessWidget {
  const CustomWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> features = [
      'Loader',
      'No Data',
      'Test',
    ];

    // actions
    List<String> actionWidgets = ['Touch', 'InkTouch'];
    List<String> actionWidgetsDescription = [
      'Touch is a convenient Flutter widget that simplifies the use of [GestureDetector] with translucent behavior.',
      'The `InkTouch` widget simplifies the usage of InkWell by providing parameters to configure its appearance and behavior easily.',
    ];

    // display
    List<String> widgets = ['Textr', 'Iconr', 'Textml', 'Poslign', 'None'];
    List<String> widgetsDescription = [
      'Textr is a combination of Text and Container widget. It is used to create a text with a style and margin.',
      'Iconr is a combination of Icon and Container widget. It is used to create an icon with a margin.',
      'Textml is a Flutter widget for rendering rich text with custom formatting. It allows you to define text styles, alignment, text direction, and supports basic HTML-like formatting tags such as `b`, `i`, `u`, and `color`',
      'Poslign is a Flutter widget that allows precise control over the positioning and alignment of its child widget within a container. It combines the power of Positioned, IgnorePointer, Align, and Container widgets to achieve this.',
      'None is a convenient shortcut for creating an empty, zero-sized box using SizedBox.shrink()',
    ];

    // behavior
    List<String> behaviorWidgets = ['Wrapper', 'Intrinsic', 'BounceScroll', 'Unglow'];
    List<String> behaviorWidgetsDescription = [
      'Wrapper is a versatile Flutter widget that provides a convenient way to wrap child widgets. It includes features like handling background taps to dismiss the keyboard and controlling the back button press behavior. This widget simplifies common wrapping tasks in Flutter apps.',
      'A simplified version of the Flutter [IntrinsicHeight] widget. The `Intrinsic` widget provides an easier way to create an intrinsic height layout for a list of children. It simplifies the process of ensuring that all children have the same height based on the tallest child in either a horizontal or vertical layout.',
      'BounceScroll is a custom Flutter [ScrollPhysics] class that enhances scroll behavior by providing a bouncing effect when the scroll reaches its limits. It is particularly useful when you want to add a realistic bouncing behavior to your scrollable widgets.',
      'Unglow is a Flutter [ScrollBehavior] that prevents the scroll glow effect typically seen when reaching the scroll limits. It allows you to create a scrollable widget without the built-in overscroll indicator.',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Widgets'),
      ),
      body: LzListView(children: [
        ...actionWidgets.generate((item, i) {
          return InkTouch.space(
            onTap: () => Actions.on(context, item.toLowerCase()),
            border: Br.only(['t'], except: i == 0),
            child: Column(
              children: [
                Textr(item, style: Gfont.bold.muted, margin: Ei.only(b: 5)),
                Text(actionWidgetsDescription[i], style: Gfont.muted)
              ],
            ).start,
          );
        }),

        const SizedBox(height: 25),

        ...widgets.generate((item, i) {
          return InkTouch.space(
            onTap: () => Actions.on(context, item.toLowerCase()),
            border: Br.only(['t'], except: i == 0),
            child: Column(
              children: [
                Textr(item, style: Gfont.bold.muted, margin: Ei.only(b: 5)),
                Text(widgetsDescription[i], style: Gfont.muted)
              ],
            ).start,
          );
        }),

        const SizedBox(height: 25),

        ...behaviorWidgets.generate((item, i) {
          return InkTouch.space(
            onTap: () => Actions.on(context, item.toLowerCase()),
            border: Br.only(['t'], except: i == 0),
            child: Column(
              children: [
                Textr(item, style: Gfont.bold.muted, margin: Ei.only(b: 5)),
                Text(behaviorWidgetsDescription[i], style: Gfont.muted)
              ],
            ).start,
          );
        }),

        const SizedBox(height: 25),

        // others
        ...features.generate((item, i) {
          return InkTouch.space(
            onTap: () => Actions.on(context, item.toLowerCase()),
            border: Br.only(['t'], except: i == 0),
            child: Row(
              mainAxisAlignment: Maa.spaceBetween,
              children: [Text(item), const Icon(Ti.chevronRight, color: Colors.black45)],
            ),
          );
        })
      ]),
    );
  }
}

class Actions {
  static on(BuildContext context, String label) {
    switch (label) {
      case 'loader':
        context.lzPush(const LoaderView());
        break;

      case 'no data':
        context.lzPush(const NoDataView());
        break;
      default:
        context.lzPush(const TestView());
        break;
    }
  }
}
