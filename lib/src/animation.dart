import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:wrap/wrap.dart';

class CenterText extends StatefulWidget {
  const CenterText(
    this.text, {
    super.key,
    this.backgroundDuration = const Duration(milliseconds: 1200),
    this.foregroundDuration = const Duration(milliseconds: 735),
    this.backgroundOpacity = 0.3,
    this.backgroundSaturation = 0.5,
  }) : assert(
          backgroundOpacity >= 0 && backgroundOpacity <= 1,
          'background opacity must be between 0 and 1: $backgroundOpacity',
        );

  final String text;

  final Duration backgroundDuration;
  final Duration foregroundDuration;
  final double backgroundOpacity;
  final double backgroundSaturation;

  @override
  State<CenterText> createState() => _CenterTextState();
}

class _CenterTextState extends State<CenterText>
    with SingleTickerProviderStateMixin {
  final _curve = CurveTween(curve: Curves.easeInOut);
  late final AnimationController _controller;
  late final double _hue;

  @override
  void initState() {
    super.initState();
    _hue = Random().nextDouble() * 360;
    _controller = AnimationController(vsync: this)
      ..duration = widget.backgroundDuration
      ..addListener(() => setState(() {}))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = HSVColor.fromAHSV(
      _curve.transform(_controller.value) * widget.backgroundOpacity,
      _hue,
      0.5,
      0.5,
    );

    return Center(child: Text(widget.text))
        .wrapBackground(color.toColor())
        .ensureTextEnvironment(context);
  }
}
