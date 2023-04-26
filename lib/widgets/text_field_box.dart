import 'package:flutter/material.dart';
//ignore: must_be_immutable
class TaskTextField extends StatelessWidget {
   TaskTextField({Key? key, required this.placeholder}) : super(key: key);

  TextEditingController inputTextFieldController = TextEditingController();
  final String placeholder;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 20),
        child: TextField(
          minLines: 1,
          maxLines: 3,
          textAlign: TextAlign.center,
          controller: inputTextFieldController,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: const TextStyle(
                color: Colors.black54,
                fontSize: 18,
              ),
              border: InputBorder.none
          ),
        ),
      ),
    );
  }
}
