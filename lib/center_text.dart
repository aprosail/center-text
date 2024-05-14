import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wrap/wrap.dart';

class CenterText extends StatefulWidget {
  const CenterText(this.text, {super.key});

  final String text;

  @override
  State<CenterText> createState() => _CenterTextState();
}

class _CenterTextState extends State<CenterText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this)
      ..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(widget.text)).ensureTextEnvironment(context);
  }
}
