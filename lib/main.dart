import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/providers/favourite_list_provider.dart';
import 'package:testing_app/providers/todo_list_provider.dart';
import 'package:testing_app/screens/favourites.dart';
import 'package:testing_app/screens/home.dart';
import 'package:testing_app/screens/todo.dart';

void main() {
  runApp(MyApp(key: UniqueKey()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavouriteProvider>(
            create: (context) => FavouriteProvider()),
        ChangeNotifierProvider(create: (context) => TodoProvider()),
      ],
      builder: (context, child) => MaterialApp(
        title: "Testing App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          FavouritesPage.routeName: (context) => const FavouritesPage(),
          TodoPage.routeName: (context) => const TodoPage(),
        },
        initialRoute: TodoPage.routeName,
      ),
    );
  }
}
