import 'package:flutter/material.dart';
import 'package:flutter_app/screens/post_form.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/screens/nav.dart';

void main() {
  group('Nav Tests', () {
    testWidgets('Renders Nav widget', (WidgetTester tester) async {

      await tester.pumpWidget(
        const MaterialApp(
          home: Nav(),
        ),
      );

      expect(find.byType(Nav), findsOneWidget);
    });

  });
}
