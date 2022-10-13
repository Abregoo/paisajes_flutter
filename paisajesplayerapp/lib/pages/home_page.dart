import 'package:flutter/material.dart';
import 'package:paisajesplayerapp/json/musica_json.dart';
import 'package:paisajesplayerapp/pages/album_page.dart';
import 'package:paisajesplayerapp/pages/datos.dart';
import 'package:paisajesplayerapp/router/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int menuactivo = 0;
  String urlimg = "assets/portadac1.jpg";
  List s = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getAppbar(),
      body: bodyApp(),
    );
  }

  getAppbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Season Music",
              style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Icon(Icons.person_rounded)
          ],
        ),
      ),
    );
  }

  bodyApp() {
    return Container(
      decoration: fondo(),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          separador(20),
          slideCombos(),
          separador(15),
          portadaCategoria(),
          separador(30),
          titulos("Trending Esta Semana"),
          separador(20),
          slideTrending(),
          separador(30),
          titulos("Nuevos Albums"),
          separador(20),
          slideAlbums(),
          separador(20),
        ]),
      ),
    );
  }

  slideCombos() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: List.generate(menu_1.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    menuactivo = index;
                    urlimg = menu_1[index]['img'];
                  });
                },
                child: Column(
                  children: [
                    Text(
                      menu_1[index]['title'],
                      style: TextStyle(
                          fontFamily: 'JosefinSans',
                          fontSize: 15,
                          color:
                              menuactivo == index ? Colors.white : Colors.white,
                          fontWeight: menuactivo == index
                              ? FontWeight.bold
                              : FontWeight.w600),
                    ),
                    menuactivo == index
                        ? Container(
                            width: 10,
                            height: 3,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                          )
                        : Container(),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  separador(double number) {
    return SizedBox(
      height: number,
    );
  }

  portadaCategoria() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      width: 400,
      height: 200,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(urlimg), fit: BoxFit.fill),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
    );
  }

  BoxDecoration fondo() {
    return const BoxDecoration(
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
        Color.fromARGB(255, 107, 105, 85),
        Color.fromARGB(255, 13, 2, 75),
        Color.fromARGB(255, 116, 4, 110),
        Color.fromARGB(255, 2, 75, 67),
      ],
    ));
  }

  titulos(String titulo) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10),
        child: Text(
          titulo,
          style: TextStyle(
              fontFamily: 'JosefinSans',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      margin: EdgeInsets.only(left: 25, right: 25),
      width: 400,
      height: 30,
      decoration: BoxDecoration(
          color: Color.fromARGB(108, 255, 255, 255),
          borderRadius: BorderRadius.circular(15)),
    );
  }

  slideTrending() {
    List lst = [];
    if (menuactivo == 0) lst = lstT_ilust;
    if (menuactivo == 1) lst = lstT_otonio;
    if (menuactivo == 2) lst = lstT_prim;
    if (menuactivo == 3) lst = lstT_vera;
    if (menuactivo == 4) lst = lstT_noct;

    final menuOptions = AppRoutes.menuOptions;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          children: List.generate(lst.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, menuOptions[0].route);
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(lst[index]['img']),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      separador(5),
                      Text(
                        lst[index]['title'],
                        style: const TextStyle(
                            fontFamily: 'JosefinSans',
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        lst[index]['title'],
                        style: const TextStyle(
                            fontFamily: 'JosefinSans',
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  slideAlbums() {
    List lst = [];
    if (menuactivo == 0) {
      lst = lstAlb_ilust;
    }
    if (menuactivo == 1) {
      lst = lstAlb_otonio;
    }
    if (menuactivo == 2) {
      lst = lstAlb_prim;
    }
    if (menuactivo == 3) {
      lst = lstAlb_vera;
    }
    if (menuactivo == 4) {
      lst = lstAlb_noct;
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          children: List.generate(lst.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Container(
                child: GestureDetector(
                  onTap: () {
                    if (menuactivo == 0) {
                      if (index == 0) {
                        s = lstAlb1C1;
                      }
                      if (index == 1) {
                        s = lstAlb2C1;
                      }
                    }
                    if (menuactivo == 1) {
                      if (index == 0) {
                        s = lstAlb1C2;
                      }
                      if (index == 1) {
                        s = lstAlb2C2;
                      }
                    }
                    if (menuactivo == 2) {
                      if (index == 0) {
                        s = lstAlb1C3;
                      }
                      if (index == 1) {
                        s = lstAlb2C3;
                      }
                    }
                    if (menuactivo == 3) {
                      if (index == 0) {
                        s = lstAlb1C4;
                      }
                      if (index == 1) {
                        s = lstAlb2C4;
                      }
                    }
                    if (menuactivo == 4) {
                      if (index == 0) {
                        s = lstAlb1C5;
                      }
                      if (index == 1) {
                        s = lstAlb2C5;
                      }
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AlbumPage(datos: Datos(s))));
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 180,
                        height: 260,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(lst[index]['img']),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      separador(5),
                      Text(
                        lst[index]['title'],
                        style: const TextStyle(
                            fontFamily: 'JosefinSans',
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        lst[index]['title'],
                        style: const TextStyle(
                            fontFamily: 'JosefinSans',
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
