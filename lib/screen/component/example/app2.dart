import 'package:flutter/material.dart';

class App2 extends StatelessWidget {
  const App2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    const double iconSize = 60.0;
    const double textSize = 44.0;
    return Scaffold(
        appBar: AppBar(title: const Text("hola")),
        body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const <Widget>[
                MyCard(
                    title: Text(
                      "I lova Flutter",
                      style: TextStyle(color: Colors.amber, fontSize: textSize),
                    ),
                    ico: Icon(
                      Icons.favorite,
                      size: iconSize,
                      color: Colors.red,
                    )),
                MyCard(
                  title: Text(
                    "I link this  Video",
                    style:
                        TextStyle(color: Colors.redAccent, fontSize: textSize),
                  ),
                  ico:
                      Icon(Icons.thumb_up, size: iconSize, color: Colors.amber),
                ),
                MyCard(
                    title: Text(
                      "Next video",
                      style: TextStyle(color: Colors.green, fontSize: textSize),
                    ),
                    ico: Icon(Icons.queue_play_next,
                        size: iconSize, color: Colors.brown)),
              ]),
        ));
  }
}

class MyCard extends StatelessWidget {
  final Widget title;
  final Widget ico;
  const MyCard({super.key, required this.title, required this.ico});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.10),
      child: Card(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: <Widget>[title, ico])),
      ),
    );
  }
}
