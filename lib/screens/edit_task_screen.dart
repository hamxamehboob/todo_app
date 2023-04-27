import 'package:flutter/material.dart';
import 'package:todo_app/Screens/task_screen.dart';
import 'package:todo_app/model/db_,model.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/widgets/text_button.dart';

import 'edit_task_screen.dart';

class EditTask extends StatefulWidget {
  final int value;

  EditTask({
    Key,
    key,
    required this.value,
  }) : super(key: key);

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  final TextEditingController inputTextFieldController =
      TextEditingController();
  var db = DatabaseConnect();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCDD6E8),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const TaskScreen()));
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 23,
                ),
                const Text(
                  "Edit a task",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 20),
                child: TextField(
                  minLines: 1,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  controller: inputTextFieldController,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                  decoration: const InputDecoration(
                      hintText: "Write a task",
                      hintStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                      border: InputBorder.none),
                ),
              )),
          TextBoxButton(
            placeholder: 'Update a task',
            navigation: () {
              // var myTodo = Todo(title: inputTextFieldController.text, creationDate: DateTime.now(), isChecked: false);
              updateItem();
              db.getTodo();
              setState(() {
                updateItem();
                db.getTodo();
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void updateItem() async {
    await db.updateTodo(widget.value, inputTextFieldController.text);
  }
}
