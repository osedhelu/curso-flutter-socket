// ignore: file_names
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> items = [
  "Home",
  "Explore",
  "Search",
  "Feed",
  "Post",
  "Activity",
  "Profile"
];
List<IconData> icons = [
  Icons.home,
  Icons.explore,
  Icons.search,
  Icons.feed,
  Icons.post_add,
  Icons.local_activity,
  Icons.settings,
  Icons.person
];

int current = 0;

class TabsScreen01 extends StatefulWidget {
  const TabsScreen01({super.key});
  @override
  State<TabsScreen01> createState() => _TabsScreen01State();
}

class _TabsScreen01State extends State<TabsScreen01> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Videos Tabs",
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.deepPurple[100],
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.deepPurpleAccent,
              title: Text(
                "Custom TabBar",
                style: GoogleFonts.laila(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            body: ContainerApp(
              onEventTap: onEventTap,
            )));
  }

  void onEventTap(index) {
    print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx$index");
    setState(() {
      current = index;
    });
  }
}

class ContainerApp extends StatelessWidget {
  final Function(int) onEventTap;
  const ContainerApp({
    super.key,
    required this.onEventTap,
  });

  Widget FnitemBuilder(BuildContext context, int index) {
    return Column(
      children: <Widget>[
        GestureDetector(
            onTap: () {
              onEventTap(index);
            },
            child: AnimatedContainer(
              duration: const Duration(microseconds: 300),
              margin: const EdgeInsets.all(5),
              height: 45,
              width: 80,
              decoration: BoxDecoration(
                  color: current == index ? Colors.white70 : Colors.white54,
                  border: current == index
                      ? Border.all(color: Colors.deepPurpleAccent, width: 4)
                      : null,
                  borderRadius: current == index
                      ? BorderRadius.circular(15)
                      : BorderRadius.circular(10)),
              child: Center(
                  child: Text(items[index],
                      style: GoogleFonts.laila(
                          fontWeight: FontWeight.w500,
                          color:
                              current == index ? Colors.black : Colors.grey))),
            )),
        Visibility(
            visible: current == index,
            child: Container(
              width: 5,
              height: 5,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurpleAccent,
              ),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: double.infinity,
      height: double.infinity,
      child: Column(children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: FnitemBuilder),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30),
          width: double.infinity,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icons[current], size: 200, color: Colors.deepPurpleAccent),
              const SizedBox(
                height: 2,
              ),
              Text(items[current],
                  style: GoogleFonts.laila(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      color: Colors.deepPurpleAccent)),
            ],
          ),
        )
      ]),
    );
  }
}
