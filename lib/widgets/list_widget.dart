import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:intl/intl.dart';

import '../Screens/edit_task_screen.dart';

//ignore: must_be_immutable
class ListWidget extends StatefulWidget {
  final int id;
  final String title;
  final DateTime creationDate;
  final Function insertFunction;
  final Function deleteFunction;
  bool isChecked;
  final Function updateFunction;

  ListWidget({
    Key? key,
    required this.id,
    required this.title,
    required this.isChecked,
    required this.creationDate,
    required this.insertFunction,
    required this.deleteFunction,
    required this.updateFunction,
  }) : super(key: key);

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  late int id = widget.id;

  @override
  Widget build(BuildContext context) {
    dynamic anotherTodo = Todo(
        title: widget.title,
        creationDate: widget.creationDate,
        isChecked: widget.isChecked,
        id: widget.id);
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        padding: const EdgeInsets.only(right: 12, top: 12, bottom: 12),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Row(
          children: [
            Checkbox(
              shape: const RoundedRectangleBorder(),
              checkColor: Colors.white,
              activeColor: const Color(0xFF283593),
              value: widget.isChecked,
              onChanged: (bool? value) {
                setState(
                  () {
                    widget.isChecked = value!;
                  },
                );
                anotherTodo.isChecked = value!;
                widget.insertFunction(anotherTodo);
              },
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                        color: Color(0xFF040404),
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  Text(
                    DateFormat('dd MMM yyyy - hh:mm aaa')
                        .format(widget.creationDate),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8F8F8F),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: const Icon(
                Icons.edit,
                color: Colors.grey,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => EditTask(
                      updateFunction: widget.updateFunction,
                      value: id,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(width: 4),
            GestureDetector(
              onTap: () {
                showDialog(context: context, builder: (ctx) =>AlertDialog(title: Text("Confirm Delete"),actions: [
                  TextButton(onPressed:(){
                    Navigator.of(ctx).pop();
                  }, child: Container(
                    color: Colors.grey,child: Text("Yes"),
                  ))
                ],));
                widget.deleteFunction(anotherTodo);
              },
              child: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
