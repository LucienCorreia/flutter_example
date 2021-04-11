import 'package:flutter/material.dart';
import 'package:flutter_example/presenter/pages/home/home_page.dart';
import 'package:flutter_example/presenter/pages/home/widgets/card_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HomePage', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomePage(),
      ),
    );

    expect(find.byType(CardWidget), findsNWidgets(1));
    expect(find.byKey(Key('card-github-users')), findsOneWidget);
  });
}