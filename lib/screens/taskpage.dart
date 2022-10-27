import 'package:flutter/material.dart';
import 'package:todo_list_app/database_service.dart';
import 'package:todo_list_app/models/task.dart';
import 'package:todo_list_app/widgets.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 24.0,
                      bottom: 6.0,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Image(
                              image: AssetImage(
                                  'assets/images/back-arrow-icon.png'),
                              width: 24.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            onSubmitted: (value) async {
                              print("Teste $value");

                              if (value != '') {
                                DatabaseService dbService = DatabaseService();

                                Task newTask = Task(
                                  id: 1,
                                  title: value,
                                  description: '',
                                );

                                await dbService.insertTask(newTask);
                              }

                            },
                            decoration: InputDecoration(
                              hintText: 'Insira o nome da tarefa',
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF211551),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 12.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Insira a descrição da tarefa",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 24.0,
                          )),
                    ),
                  ),
                  TodoWidget(
                    isDone: true,
                    text: 'Crie sua primeira tarefa',
                  ),
                  TodoWidget(
                    text: '',
                    isDone: false,
                  ),
                  TodoWidget(
                    text: '',
                    isDone: false,
                  ),
                  TodoWidget(
                    isDone: false,
                    text: '',
                  ),
                ],
              ),
              Positioned(
                bottom: 24.0,
                right: 24.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFFE3577),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Image(
                      image: AssetImage("assets/images/delete-icon.png"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
