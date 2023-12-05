import 'package:flutter/material.dart';
import 'package:flutter_app/screens/notifications.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Renders NotificationsPage widget', (WidgetTester tester) async {

    await tester.pumpWidget(
      const MaterialApp(
        home: NotificationsPage(),
      ),
    );


    expect(find.byType(NotificationsPage), findsOneWidget);
  });

  testWidgets('Displays correct title in the AppBar', (WidgetTester tester) async {

    await tester.pumpWidget(
      const MaterialApp(
        home: NotificationsPage(),
      ),
    );


    expect(find.text('Notifications'), findsOneWidget);
  });

  testWidgets('Displays notification icon and message', (WidgetTester tester) async {

    await tester.pumpWidget(
      const MaterialApp(
        home: NotificationsPage(),
      ),
    );


    expect(find.byIcon(Icons.notifications), findsOneWidget);


    expect(find.text('No notifications yet.'), findsOneWidget);
  });


}
