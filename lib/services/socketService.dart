import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

enum ServerStatus { Online, Offline, Connecting }

class SocketService with ChangeNotifier {
  late ServerStatus _serverStatus = ServerStatus.Connecting;
  ServerStatus get servertStatus => _serverStatus;
  late Socket _socket;
  Function get emit => _socket.emit;
  Function get on => _socket.on;
  Socket get socket => _socket;

  SocketService() {
    _initConfig();
  }

  void _initConfig() {
    _socket = io(
        'http://192.168.0.106:7676/',
        OptionBuilder()
            .enableAutoConnect()
            .setTransports(["websocket"]).build());
    _socket.onConnect((_) {
      _serverStatus = ServerStatus.Online;
      notifyListeners();
    });
    _socket.onDisconnect((_) {
      _serverStatus = ServerStatus.Offline;
      notifyListeners();
    });
    _socket.on('fromServer', (payload) {
      print("name:   ${payload['name']}");
      print("lastname:   ${payload['lastname']}");
      print(
          "lastname:   ${payload.containsKey('message2') ? payload['message2'] : 'esta propiedad no viene'}");
    });
  }
}
