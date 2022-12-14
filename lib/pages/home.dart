import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda/models/all.dart';
import 'package:tienda/services/socketService.dart';
import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final SocketService socketServer;
  List<Band> bands = [];

  @override
  void initState() {
    socketServer = Provider.of<SocketService>(context, listen: false);
    super.initState();
    socketServer.on('band-conection', _handleActiveBands);
  }

  _handleActiveBands(payload) {
    setState(() {
      bands = (payload as List).map((e) => Band.fromMap(e)).toList();
    });
  }

  @override
  dispose() {
    super.dispose();
    socketServer.socket.off("band-conection");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("BandNames",
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: socketServer.servertStatus == ServerStatus.Online
                // ignore: dead_code
                ? Icon(
                    Icons.check_circle,
                    color: Colors.green[300],
                  )
                // ignore: dead_code
                : Icon(
                    Icons.offline_bolt,
                    color: Colors.red[300],
                  ),
          )
        ],
      ),
      body: Column(
        children: [
          _showGraph(),
          Expanded(
            child: ListView.builder(
              itemCount: bands.length,
              itemBuilder: (context, i) => _bandTitle(bands[i]),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 1, onPressed: _addNewBand, child: const Icon(Icons.add)),
    );
  }

  Widget _showGraph() {
    List<Color> colorList = [
      const Color.fromARGB(255, 225, 239, 250),
      const Color.fromARGB(255, 142, 200, 247),
      const Color.fromRGBO(252, 228, 236, 1),
      const Color.fromRGBO(244, 143, 177, 1),
      const Color.fromRGBO(255, 253, 231, 1),
      const Color.fromRGBO(255, 245, 157, 1),
    ];
    Map<String, double> dataMap = {};
    for (var band in bands) {
      dataMap.putIfAbsent(band.name, () => band.vote.toDouble());
    }
    return SizedBox(
        width: double.infinity,
        height: 200,
        child: bands.isEmpty
            ? const Center(child: Text("....loading "))
            : PieChart(
                dataMap: dataMap,
                animationDuration: const Duration(milliseconds: 800),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                colorList: colorList,
                initialAngleInDegree: 0,
                chartType: ChartType.ring,
                ringStrokeWidth: 32,
                centerText: "HYBRID",
                legendOptions: const LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: const ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: false,
                  decimalPlaces: 1,
                ),
              ));
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
        trailing: Text("${band.vote}"),
        onTap: () => _onTapEvent(band.id),
      ));

  _onTapEvent(String name) {
    print("🚀 ~ file: home.dart:97 ~ _HomePageState ~ _onTapEvent ~ $name");
    socketServer.emit(
      "updateBand",
      {"id": name},
    );
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
      setState(() {
        socketServer.emit('createBand', {"name": text});
        bands.add(Band(id: "${bands.length + 1}", name: text, vote: 0));
        print(
            "🚀 ~ file: home.dart:142 ~ _HomePageState ~ void_addBandToList ~ $text");
      });
    }
    Navigator.pop(context);
  }

  void _onDismissedDireccion(DismissDirection direction, Band band) {
    setState(() {
      bands = [];
      socketServer.emit("removeBand", band.id);
    });
  }
}
