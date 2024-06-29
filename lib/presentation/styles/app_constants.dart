import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppConstants {
  static final BorderRadius borderRadius16 = BorderRadius.circular(16);
  static final BorderRadius borderRadius24 = BorderRadius.circular(24);
  static final BorderRadius borderRadius32 = BorderRadius.circular(32);
  static final BorderRadius borderRadius40 = BorderRadius.circular(40);

  static const Gap gap64 = Gap(64);
  static const Gap gap32 = Gap(32);
  static const Gap gap20 = Gap(20);
  static const Gap gap8 = Gap(8);
  static const Gap gap4 = Gap(4);

  static const EdgeInsets padding8 = EdgeInsets.all(8);
  static const EdgeInsets paddingH8 = EdgeInsets.symmetric(horizontal: 8);
  static const EdgeInsets paddingV8 = EdgeInsets.symmetric(vertical: 8);
  static const EdgeInsets padding14 = EdgeInsets.all(14);
  static const EdgeInsets padding16 = EdgeInsets.all(16);
  static const EdgeInsets paddingH16 = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets paddingV16 = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets padding32 = EdgeInsets.all(32);

  static const Duration debounceInterval = Duration(milliseconds: 500);
}
