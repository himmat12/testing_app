import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/providers/favourite_list_provider.dart';
import 'package:testing_app/screens/todo.dart';

import 'favourites.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String routeName = "HomePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Testing App"),
        actions: [
          GestureDetector(
            key: const Key("bnt01"),
            onTap: () {
              Navigator.pushNamed(context, FavouritesPage.routeName);
            },
            child: Wrap(
              runAlignment: WrapAlignment.center,
              children: const [
                Icon(Icons.favorite_border),
                Text(" Favourites ", textScaleFactor: 1.4),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, TodoPage.routeName);
        },
        child: const Icon(Icons.list_alt),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            20,
            (index) => ItemTile(
              key: Key("text_${index}_text"),
              item: index,
            ),
          ),
        ),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  const ItemTile({required this.item, Key? key}) : super(key: key);

  final int item;

  @override
  Widget build(BuildContext context) {
    final favourites = Provider.of<FavouriteProvider>(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.primaries[item % Colors.primaries.length],
          ),
        ),
        title: Text("Item $item", textScaleFactor: 1.2),
        trailing: IconButton(
          onPressed: () {
            favourites.addToList(item);
          },
          icon: Icon(favourites.favourites.contains(item)
              ? Icons.favorite
              : Icons.favorite_outline),
        ),
      ),
    );
  }
}
