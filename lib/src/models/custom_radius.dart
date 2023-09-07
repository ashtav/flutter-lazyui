import 'package:flutter/material.dart';

class CustomRadius {
  final double tl, tr, bl, br;
  final double? tlr, blr, ltb, rtb, others, all;

  CustomRadius(
      {this.tl = 0,
      this.tr = 0,
      this.bl = 0,
      this.br = 0,
      this.tlr,
      this.blr,
      this.ltb,
      this.rtb,
      this.others,
      this.all});

  // convert LzRadius to BorderRadius
  static BorderRadius getRadius(CustomRadius radius) {
    return BorderRadius.only(
      topLeft: Radius.circular(
          radius.all ?? radius.others ?? radius.tlr ?? radius.ltb ?? radius.tl),
      topRight: Radius.circular(
          radius.all ?? radius.others ?? radius.tlr ?? radius.rtb ?? radius.tr),
      bottomLeft: Radius.circular(
          radius.all ?? radius.others ?? radius.blr ?? radius.ltb ?? radius.bl),
      bottomRight: Radius.circular(
          radius.all ?? radius.others ?? radius.blr ?? radius.rtb ?? radius.br),
    );
  }
}
