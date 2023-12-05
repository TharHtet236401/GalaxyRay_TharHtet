import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/models/post.dart';
import 'package:flutter_app/screens/post_form.dart';

void main() {
  group('PostForm Tests', () {
    testWidgets('Renders PostForm widget', (WidgetTester tester) async {
      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: PostForm(),
        ),
      );
      expect(find.byType(PostForm), findsOneWidget);
    });
  });
}
