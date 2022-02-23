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
      /// textfield widget test
      testWidgets("text field test", (tester) async {
        await tester.pumpWidget(createWidget(TodoPage()));
        // await tester.enterText(find.byType(TextFormField), "test text 01");
        // expect(find.text("test text 01"), findsOneWidget);
        await tester.tap(find.byType(ElevatedButton));
        await tester.pumpAndSettle();
        expect(find.text("field should not be empty"), findsOneWidget);
      });
    },
  );
}
