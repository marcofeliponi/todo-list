import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/provider/todos.dart';
import 'package:todo_list_app/widget/todo_widget.dart';

class CompletedListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todosCompleted;

    print('Teste -> ${todos}');
    return todos.isEmpty
        ? Center(
            child: Text(
              'Sem tarefas completas.',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(height: 8),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return TodoWidget(todo: todo);
            },
          );
  }
}
