import 'package:flutter/cupertino.dart';
import 'package:testing_app/models/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  List<TodoModel> todoList = [];

  // add todo notes
  void addTodo(TodoModel todo) {
    todoList.add(todo);
    notifyListeners();
  }

  // remove todo notes
  void removeTodo(TodoModel todo) {
    todoList.remove(todo);
    notifyListeners();
  }
}
