import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/providers/todo_list_provider.dart';
import 'package:testing_app/screens/todo.dart';

late TodoProvider _provider;

Widget createWidget(Widget child) {
  return ChangeNotifierProvider<TodoProvider>(
    create: (context) {
      _provider = TodoProvider();
      return _provider;
    },
    child: MaterialApp(home: child),
  );
}

void main() {
  group(
    "todo widget test:",
    () {
      /// todo widget test
      testWidgets("todo widget test", (tester) async {
        await tester.pumpWidget(createWidget(TodoPage()));
        await tester.enterText(find.byType(TextFormField), "hello");
        await tester.tap(find.byType(ElevatedButton));
        await tester.pump();
        expect(find.text("hello"), findsOneWidget);
        await tester.drag(find.byType(Dismissible), const Offset(500, 0));
        await tester.pumpAndSettle();
        expect(find.text("hello"), findsNothing);
      });
    },
  );
}
