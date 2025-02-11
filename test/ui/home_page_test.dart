import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_app/presentation/pages/home_page.dart';
import 'package:guia_moteis_app/presentation/widgets/home_header.dart';
import 'package:guia_moteis_app/providers/motel_provider.dart';
import 'package:provider/provider.dart';

void main() {
  group('HomePage Simple Component Tests', () {
    late MotelProvider motelProvider;

    setUp(() {
      motelProvider = MotelProvider();
    });

    Widget buildTestableWidget() {
      return MaterialApp(
        home: ChangeNotifierProvider.value(
          value: motelProvider,
          child: const HomePage(),
        ),
      );
    }

    testWidgets('Should render HomeHeader', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget());

      expect(find.byType(HomeHeader), findsOneWidget);
    });

    testWidgets('Should render FloatingActionButton with Mapa label', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget());

      expect(find.byType(FloatingActionButton), findsOneWidget);

      expect(find.text('Mapa'), findsOneWidget);
    });

    testWidgets('Should render CircularProgressIndicator when loading', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
