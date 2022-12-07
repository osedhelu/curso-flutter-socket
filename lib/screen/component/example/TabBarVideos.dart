// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabBarVideos extends StatefulWidget {
  const TabBarVideos({super.key});
  @override
  State<TabBarVideos> createState() => _TabBarVideosState();
}

class _TabBarVideosState extends State<TabBarVideos> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TabBar"),
          bottom: const TabBar(tabs: [
            Tab(
              text: "Tab1",
            ),
            Tab(
              text: "Tab2",
            ),
            Tab(
              text: "Tab3",
            )
          ]),
        ),
        body: TabBarView(children: [
          Center(
            child: Text(
              "page 1",
              style: GoogleFonts.laila(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Center(
            child: Text(
              "page 2",
              style: GoogleFonts.laila(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Center(
            child: Text(
              "page 3",
              style: GoogleFonts.laila(
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ]),
      ));
}
