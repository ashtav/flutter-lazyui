import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class Feature {
  final String title;
  final String description;
  final IconData icon;

  Feature(this.title, this.description, this.icon);
}

List<Map<String, dynamic>> _features = [
  {
    'title': 'Tools',
    'description':
        'A collection of utilities for efficient form management and streamlined data input, ensuring a smooth user experience.',
    'features': [
      Feature(
          'LzForm',
          'Customizable form with validation, error handling and ease full control of your form.',
          Ti.forms),
      Feature(
          'LzPicker',
          'Date picker, time picker and show a list of options in a bottom sheet, with search, disabled items, etc.',
          Ti.alignBoxCenterBottom),
      // 'App Intro',
      // 'Widgets'
    ]
  },
  {
    'title': 'Interaction',
    'description':
        'Dynamic elements designed to facilitate user actions, confirmations, and navigation, enhancing overall interactivity.',
    'features': [
      Feature(
          'LzButton',
          'Customizable button with icon, type, loading, disabled, etc.',
          Ti.click),
      Feature(
          'LzDrop',
          'Show dropdown options in any position, with icons, separators, etc.',
          Ti.dragDrop),
      Feature(
          'LzPad',
          'Show an otp or pin input with a custom message, duration, input, etc.',
          Ti.number),
      Feature(
          'LzOption',
          'Display dynamic menus with optional associated widgets triggered upon selection.',
          Ti.menu2),
      Feature(
          'LzConfirm',
          'Show a confirmation dialog with a custom message, title, etc.',
          Ti.questionMark),
      Feature(
          'Refreshtor',
          'Show a pull to refresh indicator with a custom color, size, etc.',
          Ti.refresh),
      Feature(
          'Trainer',
          'Show guide to use your app with a custom message, title, etc.',
          Ti.books),
    ]
  },
  {
    'title': 'Widgets',
    'description':
        'A variety of visual components to display content, notifications, placeholders, and collapsible sections for a polished interface.',
    'features': [
      Feature('LzToast', 'Show a toast message with a custom icon, color, etc.',
          Ti.bell),
      Feature(
          'LzImage',
          'Display image in any format such as network, asset, file, etc.',
          Ti.photo),
      Feature(
          'Skeleton',
          'Show a skeleton loader with a custom color, animation, etc.',
          Ti.loader),
      Feature(
          'LzAccordion',
          'Expandable widget with a custom header, body, etc.',
          Ti.layoutNavbarExpand),
      Feature(
          'LzBadge & LzCard',
          'Show a badge or card with a custom color, size, etc.',
          Ti.creditCard),
      Feature(
          'LzListView',
          'Scrollable lists with various features such as scroll limits, custom scroll controllers, and automatic caching.',
          Ti.list),
    ]
  },
  {
    'title': 'Custom Widgets',
    'description':
        'A collection of custom widgets that can be used to build your own custom UI components.',
    'features': [
      Feature(
          'Custom Widgets',
          'List of custom widgets that can be used to build your own custom UI components.',
          Ti.category),
    ]
  },
  {
    'title': 'Utilities',
    'description':
        'A collection of utilities for efficient form management and streamlined data input, ensuring a smooth user experience.',
    'features': [
      Feature(
          'Custom Utilities',
          'List of custom utilities that can be used to build your own custom UI components.',
          Ti.tools),
    ]
  },
];

List<Map<String, dynamic>> get features {
  for (var featureMap in _features) {
    if (featureMap['features'] != null) {}
    (featureMap['features'] as List<Feature>)
        .sort((a, b) => a.title.compareTo(b.title));
  }

  return _features;
}
