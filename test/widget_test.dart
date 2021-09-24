// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:board_game_app/pages/home_screen.dart';
import 'package:board_game_app/pages/settings_screen.dart';
import 'package:board_game_app/pages/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:board_game_app/pages/collections_screen.dart';

void main() {

  testWidgets('Bottom Navigation Bar Tests', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
       MaterialApp(
        routes: {
          '/': (context) => const HomeScreen(),
          '/Collections': (context) => const CollectionsScreen(),
          '/WishList': (context) => const WishListScreen(),
          '/Settings': (context) => const SettingsScreen(),
        },
        initialRoute: '/',

      ),
    );

    await tester.tap(find.byIcon(Icons.settings));
    // Simply verify Icons and text
    expect(find.text('Home'), findsWidgets);
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.text('WishList'), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
    expect(find.byIcon(Icons.settings), findsOneWidget);
    expect(find.text('Collections'), findsOneWidget);
    expect(find.byIcon(Icons.view_column_outlined), findsOneWidget);
  });
}
