import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class Feature {
  final String label;
  final IconData icon;

  Feature({required this.label, required this.icon});
}

class FeatureGroup {
  final String label;
  final List<Feature> features;

  FeatureGroup({required this.label, required this.features});
}

List<FeatureGroup> get features => [
      FeatureGroup(
        label: 'UI Components',
        features: [
          Feature(label: 'LzAccordion', icon: Hi.squareArrowDown01),
          Feature(label: 'LzBadge', icon: Hi.honor),
          Feature(label: 'LzButton', icon: Hi.addSquare),
          Feature(label: 'LzCard', icon: Hi.creditCardPos),
          Feature(label: 'LzDropdown', icon: Hi.menu02),
          Feature(label: 'Textr', icon: Hi.textFont),
          Feature(label: 'Iconr', icon: Hi.informationSquare),
        ],
      ),
      FeatureGroup(
        label: 'Forms & Inputs',
        features: [
          Feature(label: 'LzForm', icon: Hi.pencilEdit02),
          Feature(label: 'LzPad', icon: Hi.dialpadCircle01),
          Feature(label: 'LzPicker', icon: Hi.colorPicker),
        ],
      ),
      FeatureGroup(
        label: 'Feedback & Notifications',
        features: [
          Feature(label: 'LzConfirm', icon: Hi.helpSquare),
          Feature(label: 'Shimmer', icon: Hi.loading03),
          Feature(label: 'LzToast', icon: Hi.notification03),
        ],
      ),
      FeatureGroup(
        label: 'Themes & Display',
        features: [
          Feature(label: 'LzImage', icon: Hi.image02),
          Feature(label: 'LzTheme', icon: Hi.paintBrush04),
        ],
      ),
      FeatureGroup(
        label: 'Utilities',
        features: [
          Feature(label: 'LzCountDown', icon: Hi.timeQuarterPass),
          Feature(label: 'LzListView', icon: Hi.rightToLeftListBullet),
          Feature(label: 'Refreshtor', icon: Hi.refresh),
          Feature(label: 'LzTextCount', icon: Hi.arrangeByNumbers19),
          Feature(label: 'Trainer', icon: Hi.bookOpen02),
        ],
      ),
    ];
