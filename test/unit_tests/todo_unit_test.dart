import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/providers/todo_list_provider.dart';

final _provider = TodoProvider();

void main() {
  List<String> _list = [];
  group(
    "todo functionality unit test:",
    () {
      /// add to todo list unit test
      test(
        "add todo list test",
        () {
          _provider.addTodo("data0");
          expect(_provider.todoList.first, "data0");
          expect(_provider.textController.text == "", true);
        },
      );

      /// remove from tod list unit test
      test(
        "remove from todo list test",
        () {
          _provider.removeTodo("data0");
          expect(_provider.todoList.isEmpty, true);
        },
      );
    },
  );
}
