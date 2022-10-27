import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'ToDo List', home: TodoList());
  }
}

class TodoList extends StatefulWidget {
  @override
  TodoListState createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  final List<String> todoList = <String>[];
  final TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ToDo List')),
      body: ListView(children: getItems()),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayDialog(context),
          tooltip: 'Adicionar tarefa',
          child: Icon(Icons.add)),
    );
  }

  void _addTodoItem(String title) {
    setState(() {
      todoList.add(title);
    });
    textFieldController.clear();
  }

  Widget buildTodoItem(String title) {
    return ListTile(title: Text(title));
  }

  Future<Future> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Crie uma nova tarefa'),
            content: TextField(
              controller: textFieldController,
              decoration: const InputDecoration(hintText: 'Digite a tarefa:'),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Adicionar'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addTodoItem(textFieldController.text);
                },
              ),
              TextButton(
                child: const Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  List<Widget> getItems() {
    final List<Widget> todoWidgets = <Widget>[];
    for (String title in todoList) {
      todoWidgets.add(buildTodoItem(title));
    }
    return todoWidgets;
  }
}