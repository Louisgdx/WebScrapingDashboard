import 'package:flutter/material.dart';

class NotesDialog extends StatelessWidget {
  final List<List<dynamic>> csvData;

  NotesDialog({required this.csvData});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Notes'),
      content: Container(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: csvData.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(csvData[index].toString()),
            );
          },
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Fermer'),
        ),
      ],
    );
  }
}
