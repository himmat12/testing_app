import 'package:flutter/cupertino.dart';

class TodoProvider extends ChangeNotifier {
  List<String> todoList = [];

  final textController = TextEditingController();

  // add todo notes
  void addTodo(String data) {
    todoList.add(data);
    textController.clear();
    notifyListeners();
  }

  // remove todo notes
  void removeTodo(String data) {
    todoList.remove(data);
    notifyListeners();
  }
}
