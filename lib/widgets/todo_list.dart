import 'package:flutter/material.dart';
import '../model/db_,model.dart';
import 'list_widget.dart';

class TodoList extends StatelessWidget {
  final Function insertFunction;
  final Function deleteFunction;
  final Function updateFunction;
  final db = DatabaseConnect();

  TodoList(
      {required this.insertFunction, required this.deleteFunction, required this.updateFunction, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getTodo(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data;
          var dataLength = data!.length;

          return dataLength == 0
              ? const Center(
                  child: Text(
                    'No Data Found!',
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                )
              : ListView.builder(
                  itemCount: dataLength,
                  itemBuilder: (context, i) => ListWidget(
                    updateFunction: updateFunction,
                    id: data[i].id,
                    title: data[i].title,
                    creationDate: data[i].creationDate,
                    isChecked: data[i].isChecked,
                    insertFunction: insertFunction,
                    deleteFunction: deleteFunction,
                  ),
                );
        },
      ),
    );
  }
}
