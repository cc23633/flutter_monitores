import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_monitores/main.dart';

void main() {
  testWidgets('Verifica se os monitores são exibidos no carrossel', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verifica se o AppBar contém o título correto.
    expect(find.text('Monitores DPD'), findsOneWidget);

    // Verifica se os cards dos monitores estão sendo exibidos.
    expect(find.byType(Card), findsNWidgets(3));

    // Toca no primeiro card.
    await tester.tap(find.byType(Card).first);
    await tester.pumpAndSettle();

    // Verifica se o nome do primeiro monitor está na nova página.
    expect(find.text('Monitor 1'), findsOneWidget);
  });
}
