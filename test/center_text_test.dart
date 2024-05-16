import 'package:center_text/center_text.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('center text', (t) async {
    const message = 'it works';
    await t.pumpWidget(const CenterText(message));
    expect(find.text(message), findsOneWidget);
  });
}
