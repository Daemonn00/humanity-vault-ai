// Basic smoke test for the Humanity Vault AI home screen.

import 'package:flutter_test/flutter_test.dart';

import 'package:humanity_vault_app/features/library/data/articles_repository.dart';
import 'package:humanity_vault_app/main.dart';

void main() {
  testWidgets('Home screen shows title, main actions, and library counts',
      (WidgetTester tester) async {
    await ArticlesRepository.ensureLoaded();
    await tester.pumpWidget(const HumanityVaultApp());

    expect(find.text('Humanity Vault AI'), findsWidgets);
    expect(find.text('Browse Categories'), findsOneWidget);
    expect(find.text('Search Knowledge'), findsOneWidget);
    expect(find.text('Emergency Mode'), findsOneWidget);
    expect(find.text('11 categories · 31 articles'), findsOneWidget);
  });
}
