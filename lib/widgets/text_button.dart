import 'package:flutter/material.dart';

class TextBoxButton extends StatefulWidget {
  const TextBoxButton(
      {Key? key,
      required String placeholder,
      required void Function() navigation})
      : _navigation = navigation,
        _placeholder = placeholder,
        super(key: key);
  final String _placeholder;
  final GestureTapCallback _navigation;

  @override
  State<TextBoxButton> createState() => _TextBoxButtonState();
}

class _TextBoxButtonState extends State<TextBoxButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.only(left: 100),
                child: GestureDetector(
                  onTap: () {
                    widget._navigation();
                  },
                  child: Text(
                    widget._placeholder,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
