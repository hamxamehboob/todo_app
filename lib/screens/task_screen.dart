import 'package:flutter/material.dart';
import 'package:todo_app/screens/add_task_screen.dart';

import '../widgets/list_widget.dart';

class TaskScreen extends StatefulWidget {
  TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  List<String> items = [];
  bool valuefirst = false;

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => AddTask()));
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      backgroundColor: Color(0xFFCDD6E8),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 25),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Today's Tasks",
              style: TextStyle(
                  color: Color(0xFF222121),
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            AddListWidget(),
            AddListWidget(),
            AddListWidget(),
            AddListWidget(),
            SizedBox(height: 443),
            // Text(),
            Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom))
          ]),
        ),
      ),
    );
  }

// Widget item(BuildContext context, int index) =>
}
