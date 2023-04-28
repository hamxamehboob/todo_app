import 'package:flutter/material.dart';

//ignore: must_be_immutable
class TaskTextField extends StatefulWidget {
  const TaskTextField({Key? key, required String placeholder})
      : _placeholder = placeholder,
        super(key: key);

  final String _placeholder;

  @override
  State<TaskTextField> createState() => _TaskTextFieldState();
}

class _TaskTextFieldState extends State<TaskTextField> {
  final TextEditingController _inputTextFieldController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 20),
            child: TextFormField(
              minLines: 1,
              maxLines: 3,
              textAlign: TextAlign.center,
              controller: _inputTextFieldController,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
              decoration: InputDecoration(
                  hintText: widget._placeholder,
                  hintStyle: const TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                  border: InputBorder.none),
            ),
          ),
        ),
      ],
    );
  }
}
