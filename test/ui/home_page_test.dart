import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_app/data/models/motel_model.dart';
import 'package:guia_moteis_app/presentation/pages/home_page.dart';
import 'package:guia_moteis_app/presentation/widgets/filter_widget.dart';
import 'package:guia_moteis_app/presentation/widgets/motel_card.dart';
import 'package:guia_moteis_app/providers/motel_provider.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockMotelProvider extends Mock implements MotelProvider {}

void main() {
  group('HomePage Widget Tests', () {
    testWidgets('displays loading indicator when data is loading', (WidgetTester tester) async {
      final mockMotelProvider = MockMotelProvider();

      when(mockMotelProvider.isLoading).thenReturn(true);

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider.value(
            value: mockMotelProvider,
            child: const HomePage(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('displays error message when there is an error', (WidgetTester tester) async {
      final mockMotelProvider = MockMotelProvider();

      when(mockMotelProvider.isLoading).thenReturn(false);
      when(mockMotelProvider.errorMessage).thenReturn('An error occurred');

      await tester.runAsync(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: ChangeNotifierProvider.value(
              value: mockMotelProvider,
              child: const HomePage(),
            ),
          ),
        );
      });

      expect(find.text('An error occurred'), findsOneWidget);

      expect(find.text('An error occurred'), findsOneWidget);
    });

    testWidgets('displays motels list when data is loaded', (WidgetTester tester) async {
      final mockMotelProvider = MockMotelProvider();

      when(mockMotelProvider.isLoading).thenReturn(false);
      when(mockMotelProvider.errorMessage).thenReturn(null);
      when(mockMotelProvider.motels).thenReturn([
        Motel(
          media: 2,
          fantasia: 'Motel 1',
          logo: 'https:',
          bairro: 'Bairro 1',
          distancia: 2.0,
          suites: [],
          qtdFavoritos: 2,
          qtdAvaliacoes: 2,
        ),
        Motel(
          media: 2,
          fantasia: 'Motel 2',
          logo: 'https:',
          bairro: 'Bairro 2',
          distancia: 5.0,
          suites: [],
          qtdFavoritos: 2,
          qtdAvaliacoes: 2,
        ),
      ]);

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider.value(
            value: mockMotelProvider,
            child: const HomePage(),
          ),
        ),
      );

      expect(find.byType(MotelCard), findsNWidgets(2));

      expect(find.text('Motel 1'), findsOneWidget);
      expect(find.text('Motel 2'), findsOneWidget);
    });

    testWidgets('displays filter widget and floating action button', (WidgetTester tester) async {
      final mockMotelProvider = MockMotelProvider();

      when(mockMotelProvider.isLoading).thenReturn(false);
      when(mockMotelProvider.errorMessage).thenReturn(null);
      when(mockMotelProvider.motels).thenReturn([]);

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider.value(
            value: mockMotelProvider,
            child: const HomePage(),
          ),
        ),
      );

      expect(find.byType(FilterWidget), findsOneWidget);

      expect(find.byType(FloatingActionButton), findsOneWidget);
    });
  });
}
