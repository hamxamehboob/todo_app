import 'package:flutter/material.dart';
import 'package:todo_app/model/db_model.dart';
import 'package:todo_app/screens/add_task_screen.dart';
import 'package:todo_app/widgets/todo_list.dart';
import '../model/todo_model.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final _db = DatabaseConnect();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => AddTask(insertFunction: addItem,)));
          },
          label: const Text(
            "Add Task",
            style: TextStyle(
                color: Colors.pink, fontSize: 17, fontWeight: FontWeight.bold),
          )),
      backgroundColor: const Color(0xFFCDD6E8),
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Today's Task",
              style: TextStyle(
                  color: Color(0xFF222121),
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            TodoList(
              insertFunction: addItem,
              deleteFunction: deleteItem,
              updateFunction: updateTask,
            ),
          ],
        ),
      ),
    );
  }

  void addItem(Todo todo) async {
    await _db.insertTodo(todo);
    setState(() {});
  }

  void deleteItem(Todo todo) async {
    await _db.deleteTodo(todo);
    setState(() {});
  }

  void updateTask(id, title) async {
    await _db.updateTodo(id, title);
    setState(() {});
  }
}
