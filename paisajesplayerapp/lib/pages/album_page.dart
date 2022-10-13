import 'package:flutter/material.dart';
import 'package:paisajesplayerapp/json/musica_json.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _HomePageState();
}

class _HomePageState extends State<AlbumPage> {
  int menuactivo = 0;
  String urlimg = "assets/portadac1.jpg";
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
          portadaCategoria(),
          separador(10),
          titulos("Album: Nombre del Album"),
          separador(20),
          slideAlbums(),
          separador(90),
        ]),
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
        Color.fromARGB(255, 150, 150, 149),
        Color.fromARGB(255, 13, 2, 75),
        Color.fromARGB(255, 97, 56, 28),
        Color.fromARGB(186, 19, 62, 80),
      ],
    ));
  }

  titulos(String titulo) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 60, top: 3),
        child: Text(
          titulo,
          style: TextStyle(
            color: Colors.white,
              fontFamily: 'Pacifico',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      margin: EdgeInsets.only(left: 25, right: 25),
      width: 400,
      height: 35,
      decoration: BoxDecoration(
          color: Color.fromARGB(129, 0, 0, 0),
          borderRadius: BorderRadius.circular(15)),
    );
  }

  

  slideAlbums() {
    List lst = [];
    if (menuactivo == 0) lst = lstAlb_ilust;
    if (menuactivo == 1) lst = lstAlb_otonio;
    if (menuactivo == 2) lst = lstAlb_prim;
    if (menuactivo == 3) lst = lstAlb_vera;
    if (menuactivo == 4) lst = lstAlb_noct;

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
                  onTap: () {},
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
