import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda/pages/all.dart';
import 'package:tienda/services/all.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => SocketService())],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Material App",
      initialRoute: 'home',
      routes: {
        "home": (_) => const HomePage(),
        "status": (_) => const StatusPage()
      },
    ),
  ));
}
