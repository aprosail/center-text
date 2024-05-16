import 'dart:math';

import 'package:flutter/widgets.dart';

class CenterTextOptions {
  const CenterTextOptions({
    this.backgroundCurve = Curves.easeInOut,
    this.foregroundCurve = Curves.easeInOut,
    this.backgroundDuration = const Duration(milliseconds: 1235),
    this.foregroundDuration = const Duration(milliseconds: 745),
    this.backgroundHue,
    this.foregroundHue,
    this.foregroundHueDelta = 60,
    this.backgroundOpacity = 0.3,
    this.backgroundSaturation = 0.5,
    this.backgroundVibration = 0.5,
    this.foregroundSaturation = 0.618,
    this.foregroundVibration = 0.85,
  })  : assert(backgroundHue == null ||
            (backgroundHue >= 0 && backgroundHue <= 360)),
        assert(foregroundHue == null ||
            (foregroundHue >= 0 && foregroundHue <= 360)),
        assert(foregroundHueDelta >= 60 && foregroundHueDelta <= 300),
        assert(backgroundOpacity >= 0 && backgroundOpacity <= 1),
        assert(backgroundSaturation >= 0 && backgroundSaturation <= 1),
        assert(backgroundVibration >= 0 && backgroundVibration <= 1),
        assert(foregroundSaturation >= 0 && foregroundSaturation <= 1),
        assert(foregroundVibration >= 0 && foregroundVibration <= 1);

  const CenterTextOptions.transparent()
      : backgroundCurve = Curves.easeInOut,
        foregroundCurve = Curves.easeInOut,
        backgroundDuration = const Duration(seconds: 1),
        foregroundDuration = const Duration(seconds: 1),
        backgroundHue = null,
        foregroundHue = null,
        foregroundHueDelta = 60,
        backgroundOpacity = 0,
        backgroundSaturation = 0,
        backgroundVibration = 0,
        foregroundSaturation = 0,
        foregroundVibration = 0;

  final Duration backgroundDuration;
  final Duration foregroundDuration;
  final Curve backgroundCurve;
  final Curve foregroundCurve;

  final double? backgroundHue;
  final double? foregroundHue;
  final double foregroundHueDelta;

  final double backgroundOpacity;
  final double backgroundSaturation;
  final double backgroundVibration;

  final double foregroundSaturation;
  final double foregroundVibration;

  CenterTextHues get hues {
    final background =
        backgroundHue ?? foregroundHue ?? Random().nextDouble() * 360;
    final foreground = foregroundHue ?? background;
    final foregroundEnd = foreground + foregroundHueDelta;
    return CenterTextHues(
      background: background,
      foregroundStart: foreground,
      foregroundEnd: foregroundEnd > 360 ? foregroundEnd - 360 : foregroundEnd,
    );
  }
}

class CenterTextHues {
  const CenterTextHues({
    required this.background,
    required this.foregroundStart,
    required this.foregroundEnd,
  })  : assert(background >= 0 && background <= 360),
        assert(foregroundStart >= 0 && foregroundStart <= 360),
        assert(foregroundEnd >= 0 && foregroundEnd <= 360);

  const CenterTextHues.zero()
      : background = 0,
        foregroundStart = 0,
        foregroundEnd = 0;

  final double background;
  final double foregroundStart;
  final double foregroundEnd;
}
