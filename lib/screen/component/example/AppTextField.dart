// ignore: file_names
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({super.key, required this.title});
  final String title;
  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final TextEditingController controller = TextEditingController();
  // ignore: non_constant_identifier_names
  void TextFieldoOnSubmitted(String value) => setState(() {
        controller.text = "";
        text = "$text\n$value";
      });

  // ignore: non_constant_identifier_names
  void TextFieldOnChange(String value) => setState(() {
        textChange = value;
      });

  String text = "";
  String textChange = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TextField Demo",
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.redAccent,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              TextField(
                decoration:
                    const InputDecoration(hintText: "Ingrese un Texto aquí..."),
                onSubmitted: TextFieldoOnSubmitted,
                onChanged: TextFieldOnChange,
                controller: controller,
              ),
              Text(text),
              Text(textChange)
            ],
          ),
        ),
      ),
    );
  }
}
