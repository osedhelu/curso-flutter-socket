import 'package:flutter/material.dart';

class App3 extends StatelessWidget {
  const App3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App 3",
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyButton(),
    );
  }
}

class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  String textTest = "Flutter";
  int index = 0;
  List<String> collections = ["flutter", 'es ', "genial"];
  void onPressButton() {
    setState(() {
      if (collections.length == index) {
        index = 0;
      }

      textTest = collections[index];
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stateful Widget",
          style: TextStyle(color: Colors.white),
        ),
        shadowColor: Colors.amber,
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Text(
              textTest,
              style: const TextStyle(fontSize: 40.0),
            ),
            const Padding(padding: EdgeInsets.all(10.0)),
            ElevatedButton(
              onPressed: onPressButton,
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              child: const Text(
                "Actualizar",
                style: TextStyle(color: Colors.white),
              ),
            )
          ])),
    );
  }
}
