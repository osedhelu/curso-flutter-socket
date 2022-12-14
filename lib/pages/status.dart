import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda/services/all.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});
  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        body: Center(
            child: Text("Server Status: ${socketService.servertStatus}")),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            socketService.emit('emit-message', {
              "name": "Oscar",
              "lastname": "Herrera",
              "message": "Hola desde flutter"
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
