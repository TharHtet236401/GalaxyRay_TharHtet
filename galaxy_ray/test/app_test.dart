import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/screens/loading.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Renders App widget', (WidgetTester tester) async {

    await tester.pumpWidget(
      MaterialApp(
        home: App(),
      ),
    );


    expect(find.byType(App), findsOneWidget);
  });

  testWidgets('Renders Loading screen initially', (WidgetTester tester) async {

    await tester.pumpWidget(
      MaterialApp(
        home: App(),
      ),
    );

    expect(find.byType(Loading), findsOneWidget);
  });


}
