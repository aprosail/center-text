import 'package:flutter/widgets.dart';
import 'package:inherit/inherit.dart';
import 'package:wrap/wrap.dart';

import 'options.dart';

class CenterText extends StatefulWidget {
  const CenterText(
    this.text, {
    super.key,
    this.options,
  });

  final String text;
  final CenterTextOptions? options;

  @override
  State<CenterText> createState() => _CenterTextState();
}

class _CenterTextState extends State<CenterText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late var _height = MediaQuery.of(context).size.height;
  var _options = const CenterTextOptions.transparent();
  var _hues = const CenterTextHues.zero();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _options = context.findAndDefault(const CenterTextOptions());
      _hues = _options.hues;
      _controller
        ..duration = _options.backgroundDuration
        ..addListener(() => setState(() {}))
        ..repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final value = _controller.value;

    final backgroundValue = _options.backgroundCurve.transform(value);
    final background = HSVColor.fromAHSV(
      _options.backgroundOpacity * backgroundValue,
      _hues.background,
      _options.backgroundSaturation,
      _options.backgroundVibration,
    ).toColor();

    return widget.text
        .text(align: TextAlign.center)
        .modifyTextStyle(
          context,
          (raw) => raw.copyWith(
            fontSize: _height / 6.18,
            fontWeight: FontWeight.w900,
          ),
        )
        .wrapCenter
        .wrapPadding(EdgeInsets.all(_height / 10))
        .wrapBackground(background)
        .listenSizeChange(this, (size) => _height = size.height)
        .ensureTextEnvironment(context);
  }
}
