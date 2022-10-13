import 'package:flutter/material.dart';
import 'package:paisajesplayerapp/pages/album_page.dart';
import 'package:paisajesplayerapp/pages/cancion_page.dart';
import 'package:paisajesplayerapp/pages/home_page.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // fondo(),
        bottomNavigationBar: footer(),
        body: body());
  }

  BoxDecoration fondo() {
    return BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: [
        0.1,
        0.4,
        0.6,
        0.9,
      ],
      colors: [
        Color.fromARGB(255, 31, 30, 22),
        Colors.red,
        Colors.indigo,
        Colors.teal,
      ],
    ));
  }

  Widget footer() {
    List items = [Icons.home, Icons.search, Icons.favorite, Icons.person];

    return Container(
      height: 50,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: [
          0.1,
          0.4,
          0.6,
          0.9,
        ],
        colors: [
          Color.fromARGB(255, 0, 61, 41),
          Color.fromARGB(255, 31, 30, 22),
          Color.fromARGB(255, 61, 61, 61),
          Color.fromARGB(255, 10, 22, 88),
        ],
      )),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return IconButton(
                onPressed: () {
                  setState(() {
                    activeTab = index;
                  });
                },
                icon: Icon(items[index],
                    color: activeTab == index
                        ? Color.fromARGB(255, 235, 22, 57)
                        : Colors.white));
          }),
        ),
      ),
    );
  }

  Widget body() {
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(),
        CancionPage(),
        AlbumPage(),
        Container(
          decoration: fondo(),
          child: Center(
              child: Text(
            "Perfil",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
        ),
      ],
    );
  }
}
