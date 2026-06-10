// Basic smoke test for the Humanity Vault AI home screen.

import 'package:flutter_test/flutter_test.dart';

import 'package:humanity_vault_app/main.dart';

void main() {
  testWidgets('Home screen shows title and main actions', (WidgetTester tester) async {
    await tester.pumpWidget(const HumanityVaultApp());

    expect(find.text('Humanity Vault AI'), findsOneWidget);
    expect(find.text('Browse Categories'), findsOneWidget);
    expect(find.text('Search Knowledge'), findsOneWidget);
    expect(find.text('Emergency Mode'), findsOneWidget);
  });
}
