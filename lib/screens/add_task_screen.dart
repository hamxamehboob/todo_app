import 'package:flutter/material.dart';
import 'package:todo_app/Screens/task_screen.dart';
import 'package:todo_app/model/add_task_class.dart';
import 'package:todo_app/widgets/text_button.dart';

class AddTask extends StatelessWidget {
  AddTask({Key? key}) : super(key: key);

  TextEditingController inputTextFieldController = TextEditingController();

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
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => TaskScreen()));
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
                  "Add New Task",
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
          // Text_Field( placeholder: 'Write a task',),
          TextBoxButton(
            placeholder: 'Submit a task',
            navigation: () {
              var data =TaskPost(inputTextFieldController.text);
              Navigator.pop(context, data);
            },
          ),
        ],
      ),
    );
  }
}


