import 'package:center_text/center_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('example as placeholder', (t) async {
    await t.pumpWidget(const MaterialApp(home: Scaffold(body: Example())));
    expect(find.text('example widget'), findsOneWidget);
  });
}

class Example extends StatelessWidget {
  const Example({
    super.key,
    this.child = const CenterText('example widget'),
  });

  final Widget child;

  @override
  Widget build(BuildContext context) => child;
}
