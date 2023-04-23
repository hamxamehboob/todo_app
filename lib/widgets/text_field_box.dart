import 'package:flutter/material.dart';

class Text_Field extends StatefulWidget {
  const Text_Field({Key? key}) : super(key: key);

  @override
  State<Text_Field> createState() => _Text_FieldState();
}

class _Text_FieldState extends State<Text_Field> {
  TextEditingController InputTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
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
          controller: InputTextFieldController,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          decoration: InputDecoration(
              hintText: 'Write a text',
              hintStyle: TextStyle(
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
