import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tienda/models/all.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: "1", name: "Metalica", votes: 6),
    Band(id: "2", name: "Qeen", votes: 6),
    Band(id: "3", name: "Mana", votes: 6),
    Band(id: "4", name: "Bob Jovi", votes: 6),
    Band(id: "5", name: "Michael Jacson", votes: 6),
    Band(id: "6", name: "Cristina Agiler", votes: 6),
    Band(id: "7", name: "Merly monror", votes: 6),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("BandNames",
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, i) => _bandTitle(bands[i]),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 1, onPressed: _addNewBand, child: const Icon(Icons.add)),
    );
  }

  Widget _bandTitle(Band band) => Dismissible(
      key: Key(band.id),
      onDismissed: (DismissDirection direction) =>
          _onDismissedDireccion(direction, band),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: const Color.fromARGB(255, 245, 72, 60),
        padding: const EdgeInsets.only(left: 22.0),
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.delete,
            color: Colors.black,
          ),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(band.name.substring(0, 2)),
        ),
        title: Text(band.name),
        trailing: Text("${band.votes}"),
        onTap: () => _onTapEvent(band.name),
      ));
  _onTapEvent(String name) {
    print(name);
  }

  _addNewBand() {
    final textController = TextEditingController();
    if (!Platform.isAndroid) {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("New Band name: "),
                content: TextField(controller: textController),
                actions: [
                  MaterialButton(
                      elevation: 5,
                      textColor: Colors.blue,
                      onPressed: () => _addBandToList(textController.text),
                      child: const Text("Add"))
                ],
              ));
    }
    return showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
              title: const Text("New band name: "),
              content: CupertinoTextField(
                controller: textController,
              ),
              actions: [
                CupertinoDialogAction(
                    isDefaultAction: true,
                    onPressed: () => _addBandToList(textController.text),
                    child: const Text("Add")),
                CupertinoDialogAction(
                    isDestructiveAction: true,
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Dismiss"))
              ],
            ));
  }

  void _addBandToList(String text) {
    if (text.length > 3) {
      print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx $text");
      bands.add(Band(id: "${bands.length + 1}", name: text, votes: 0));
      setState(() {});
    }
    Navigator.pop(context);
  }

  void _onDismissedDireccion(DismissDirection direction, Band band) {
    // ignore: todo
    // TODO: llama la funccion de eliminar band
    print(
        "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx_onDismissedDireccion $direction");
    print(
        "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx_onDismissedDireccion ${band.name}");
  }
}
