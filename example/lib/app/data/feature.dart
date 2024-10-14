import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class Feature {
  final String title;
  final String description;
  final IconData icon;

  Feature(this.title, this.description, this.icon);
}

List<Map<String, dynamic>> get _features => [
      {
        'title': 'Utilities',
        'description':
            'A collection of utilities for form management, input handling, and efficiency.',
        'features': [
          Feature(
              'LzForm',
              'Customizable form with validation, error handling, and full control.',
              Ti.forms),
          Feature(
              'LzPicker',
              'Date and time picker with list options, search, and disabled items.',
              Ti.alignBoxCenterBottom),
          Feature('Custom Utilities',
              'Utilities for building custom UI components.', Ti.tools),
        ]
      },
      {
        'title': 'Interaction',
        'description':
            'Elements designed to facilitate user actions and navigation, enhancing interactivity.',
        'features': [
          Feature(
              'LzButton',
              'Customizable button with icons, loading, and disabled states.',
              Ti.click),
          Feature(
              'LzDrop',
              'Dropdown options with icons, separators, and positioning.',
              Ti.dragDrop),
          Feature(
              'LzPad',
              'OTP or pin input with customizable messages and timers.',
              Ti.dialpad),
          Feature(
              'LzOption',
              'Dynamic menus with associated widgets triggered on selection.',
              Ti.menu2),
          Feature(
              'LzConfirm',
              'Confirmation dialog with customizable messages and titles.',
              Ti.questionMark),
          Feature(
              'Refreshtor',
              'Pull to refresh indicator with custom colors and sizes.',
              Ti.refresh),
          Feature('Trainer', 'Interactive guide to help users learn your app.',
              Ti.books),
        ]
      },
      {
        'title': 'Widgets',
        'description':
            'Visual components for displaying content, notifications, and interactive sections.',
        'features': [
          Feature(
              'LzAccordion',
              'Expandable widget with customizable headers and bodies.',
              Ti.layoutNavbarExpand),
          Feature(
              'LzBadge',
              'Customizable badges and cards for displaying notifications.',
              Ti.boxAlignTop),
          Feature('LzCard', '', Ti.id),
          Feature('LzImage', 'Display images from network, assets, or files.',
              Ti.photo),
          Feature('LzListView',
              'Scrollable lists with custom controllers and caching.', Ti.list),
          Feature('LzToast',
              'Customizable toast messages with icons and colors.', Ti.bell),
          Feature('LzCountDown',
              'Countdown timer displaying time until expiration.', Ti.list),
          Feature(
              'LzTextCount',
              'Displays a text-based counter, counting from a start value to an end value (e.g., 0 to 25).',
              Ti.squareNumber1),
          Feature(
              'LzPopover',
              'Overlay displaying additional content on hover or click.',
              Ti.library),
          Feature(
              'Skeleton',
              'Skeleton loader with customizable color and animation.',
              Ti.loader),
          Feature('Custom Widgets', 'Build your own custom UI components.',
              Ti.category),
        ]
      },
      {
        'title': 'Animations & Transformations',
        'description':
            'A collection of widgets to apply animations and transformations like rotation, scaling, and translation.',
        'features': [
          Feature('Animate', '', Ti.transitionBottom),
          Feature('LzTransform', '', Ti.transform),
        ]
      },
      {
        'title': 'Experiments',
        'description':
            'A collection of examples and prototypes for custom widgets, animations, and various interactive features.',
        'features': [
          Feature('Test', '', Ti.flask),
        ]
      }
    ];

List<Map<String, dynamic>> get features {
  for (var featureMap in _features) {
    if (featureMap['features'] != null) {}
    (featureMap['features'] as List<Feature>)
        .sort((a, b) => a.title.compareTo(b.title));
  }

  return _features;
}
