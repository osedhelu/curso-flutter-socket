import 'package:flutter/material.dart';
import 'package:tienda/pages/all.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Material App",
    initialRoute: 'home',
    routes: {"home": (_) => const HomePage()},
  ));
}
