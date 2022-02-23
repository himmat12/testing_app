import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/providers/todo_list_provider.dart';

class TodoPage extends StatelessWidget {
  TodoPage({Key? key}) : super(key: key);
  static String routeName = "TodoPage";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Todo List"),
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: TextFormField(
                controller: value.textController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return " field should not be empty";
                  }
                  return null;
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate() == true) {
                value.addTodo(value.textController.text);
              }
            },
            child: const Text("Add Todo"),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: value.todoList.length,
              itemBuilder: (context, index) => Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) =>
                    value.removeTodo(value.todoList[index]),
                background: Container(color: Colors.red),
                secondaryBackground: Container(color: Colors.blue),
                child: ListTile(
                  title: Text(value.todoList[index]),
                  trailing: IconButton(
                    onPressed: () => value.removeTodo(value.todoList[index]),
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
