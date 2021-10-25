import 'package:board_game_app/pages/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {

  testWidgets('AuthScreen on Start', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
          home: AuthScreen(),
      ),
    );

    // Text on Page
    expect(find.text('Login'), findsWidgets);
    expect(find.text('Welcome back ! Login with your credentials'), findsOneWidget);
    expect(find.text('Signup'), findsOneWidget);
    //Textfield
    expect(find.byType(TextField), findsNWidgets(2));
    //Button
    expect(find.byType(ElevatedButton), findsOneWidget);
  });


}
