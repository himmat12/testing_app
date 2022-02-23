import 'package:flutter/cupertino.dart';

class FavouriteProvider extends ChangeNotifier {
  List<int> favourites = [];

  /// add to list
  void addToList(int item) {
    if (!favourites.contains(item)) {
      favourites.add(item);
    }
    notifyListeners();
  }

  /// remove from list
  void removeFromList(int item) {
    favourites.remove(item);
    notifyListeners();
  }
}
