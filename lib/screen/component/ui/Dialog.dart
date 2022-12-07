import 'package:flutter/material.dart';

class DialogPerson extends StatelessWidget {
  const DialogPerson({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Cancel booking'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(text),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('No'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Yes'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
