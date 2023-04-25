import 'package:flutter/material.dart';
import 'package:todo_app/screens/add_task_screen.dart';

import '../model/add_task_class.dart';
import 'edit_task_screen.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<TaskPost> list = [];
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.white,
            onPressed: () {
              Navigator.of(context)
                  .push<TaskPost>(MaterialPageRoute(builder: (_) => AddTask()))
                  .then((value) => setState(() {
                        list.add(TaskPost(value?.task ?? " "));
                      }));
            },
            label: const Text(
              "Add Task",
              style: TextStyle(
                  color: Colors.pink,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
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
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: lists,
                itemCount: list.length,
              ),
            ],
          ),
        ));
  }

  Widget lists(BuildContext context, int index) => Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
          padding: const EdgeInsets.only(right: 12),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Row(children: [
            Checkbox(
                shape: const RoundedRectangleBorder(),
                checkColor: Colors.white,
                activeColor: const Color(0xFF283593),
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                }),
            Expanded(
              child: Text(
                list[index].task,
                style: const TextStyle(
                    color: Color(0xFF040404),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            GestureDetector(
              child: const Icon(
                Icons.edit,
                color: Colors.grey,
              ),
              onTap: () {
                Navigator.of(context)
                    .push<TaskPost>(MaterialPageRoute(
                        builder: (_) => EditTask(value: list[index].task)))
                    .then((value) => setState(() {
                          list[index].task = value?.task ?? "";
                        }));
              },
            ),
            const SizedBox(width: 4),
            GestureDetector(
              onTap: () {
                setState(() {
                  list.removeAt(index);
                });
              },
              child: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            )
          ])));
}
