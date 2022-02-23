import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/providers/favourite_list_provider.dart';

void main() {
  group(
    "favourites all unit tests:",
    () {
      var _provider = FavouriteProvider();

      /// favs add method test
      test(
        "add to fav list method test",
        () {
          _provider.addToList(99);
          expect(_provider.favourites.contains(99), true);
        },
      );

      /// favs reduancy add condition test
      test(
        "duplicate elements test",
        () {
          _provider.addToList(99);
          expect(_provider.favourites.length == 1, true);
        },
      );

      /// favs remove method test
      test(
        "remove from list method test",
        () {
          _provider.removeFromList(99);
          expect(_provider.favourites.contains(99) == false, true);
        },
      );
    },
  );
}
