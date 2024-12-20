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
        ],
      ),
      FeatureGroup(
        label: 'Forms & Inputs',
        features: [
          Feature(label: 'Form', icon: Hi.pencilEdit02),
          Feature(label: 'Pad', icon: Hi.dialpadCircle01),
          Feature(label: 'Picker', icon: Hi.colorPicker),
        ],
      ),
      FeatureGroup(
        label: 'Feedback & Notifications',
        features: [
          Feature(label: 'Confirm', icon: Hi.helpSquare),
          Feature(label: 'Skeleton', icon: Hi.loading03),
          Feature(label: 'Toast', icon: Hi.notification03),
        ],
      ),
      FeatureGroup(
        label: 'Themes & Display',
        features: [
          Feature(label: 'Image', icon: Hi.image02),
          Feature(label: 'Theme', icon: Hi.paintBrush04),
        ],
      ),
      FeatureGroup(
        label: 'Utilities',
        features: [
          Feature(label: 'CountDown', icon: Hi.timeQuarterPass),
          Feature(label: 'ListView', icon: Hi.rightToLeftListBullet),
          Feature(label: 'Refreshtor', icon: Hi.refresh),
          Feature(label: 'TextCount', icon: Hi.arrangeByNumbers19),
          Feature(label: 'Trainer', icon: Hi.bookOpen02),
        ],
      ),
    ];
