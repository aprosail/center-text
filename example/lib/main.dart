import 'package:center_text/center_text.dart';
import 'package:flutter/material.dart';
import 'package:inherit/inherit.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) =>
      const CenterText('center text demonstration')
          .wrapInherit(const CenterTextOptions());
}
