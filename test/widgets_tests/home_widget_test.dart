import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/main.dart';
import 'package:testing_app/screens/favourites.dart';

void main() {
  /// home page widget tests
  group("widgets tests of homePage:", () {
    /// HomePage IconButton widget test
    testWidgets("IconButton onTap test", (tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.byType(IconButton).at(0));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.favorite).at(0), findsOneWidget);
    });

    /// testing if the listtiles are mounted on scrollable widget
    testWidgets("testing scrollable widget in tree", (tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(20));
      for (var i = 0; i < 20; i++) {
        expect(find.text("Item $i"), findsOneWidget);
      }
    });

    /// on favorite btn tap navigation to fav page test
    testWidgets("fav btn tap navigation to fav page test", (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.tap(find.byKey(const Key("bnt01")));
      await tester.pumpAndSettle();
      expect(find.byType(FavouritesPage), findsOneWidget);
    });
  });
}
