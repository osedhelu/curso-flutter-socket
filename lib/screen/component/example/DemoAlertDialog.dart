// ignore: file_names
import 'package:flutter/material.dart';
import 'package:tienda/screen/component/all.dart';

class DemoAlertDialog extends StatelessWidget {
  const DemoAlertDialog({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: DemonAlertScreen());
  }
}

class DemonAlertScreen extends StatefulWidget {
  const DemonAlertScreen({super.key});
  @override
  State<DemonAlertScreen> createState() => _DemonAlertScreenState();
}

class _DemonAlertScreenState extends State<DemonAlertScreen> {
  String _inputValue = "Escribe un valor";
  Future<void> _showAlertDialog(BuildContext ctx, final String text) async {
    return showDialog<void>(
        context: ctx,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return DialogPerson(
            text: text,
          );
        });
  }

  void onChangedValue(String value) {
    _inputValue = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("hola Mundo")),
      body: Center(
          child: Column(
        children: <Widget>[
          TextField(
            decoration: const InputDecoration(hintText: "Ingrese un Texto"),
            onChanged: onChangedValue,
          ),
          ElevatedButton(
            onPressed: () {
              _showAlertDialog(context, _inputValue);
            },
            child: const Text(
              "Actualizar",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      )),
    );
  }
}
