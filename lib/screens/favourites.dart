import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/providers/favourite_list_provider.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  static String routeName = "favorites";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites"),
      ),
      body: Consumer<FavouriteProvider>(
        builder: (context, value, child) => SingleChildScrollView(
          child: Column(
            children: List.from(
              value.favourites.map(
                (e) => ListTile(
                  title: Text("Item $e"),
                  trailing: IconButton(
                    onPressed: () {
                      value.removeFromList(e);
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
