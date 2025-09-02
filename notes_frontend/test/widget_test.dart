import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:notes_frontend/main.dart';

void main() {
  testWidgets('Notes app renders list screen', (WidgetTester tester) async {
    await tester.pumpWidget(const NotesApp());
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.text('Notes'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
