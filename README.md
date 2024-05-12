# Center text

A placeholder for better Flutter development experience,
that you don't need to make your child required everywhere in your code base.

```dart
class Example extends StatelessWidget {
  const Example({
    super.key,
    // Other properties...
    this.child = const CenterText('example widget'),
  });

  // Other properties...
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // Replace here with your code.
    return child;
  }
}
```
