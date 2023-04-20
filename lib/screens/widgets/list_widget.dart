import 'package:flutter/material.dart';

class AddListWidget extends StatefulWidget {
  const AddListWidget({Key? key}) : super(key: key);

  @override
  State<AddListWidget> createState() => _AddListWidgetState();
}

class _AddListWidgetState extends State<AddListWidget> {
  ValueNotifier<String> inputvalue = ValueNotifier('');
  bool valuefirst = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Row(children: [
              Checkbox(
                  shape: CircleBorder(),
                  checkColor: Colors.greenAccent,
                  activeColor: Colors.lightGreen,
                  value: this.valuefirst,
                  onChanged: (value) {
                    setState(() {
                      this.valuefirst = value!;
                    });
                  }),
              SizedBox(
                width: 20,
              ),
              ValueListenableBuilder(
                  valueListenable: valueListenable, builder: builder),
              Text(
                "Create UI",
                style: TextStyle(
                    color: Color(0xFF040404),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(width: 80,),
              Icon(Icons.edit, color: Colors.grey,),
              SizedBox(width: 10,),
              Icon(Icons.delete, color: Colors.red,)
            ]
            )
        )
    );
  }
}
