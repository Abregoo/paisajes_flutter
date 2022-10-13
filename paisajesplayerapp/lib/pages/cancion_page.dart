import 'package:flutter/material.dart';
import 'package:paisajesplayerapp/json/musica_json.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
// import 'package:audioplayers/audio_cache.dart';

class CancionPage extends StatefulWidget {
  const CancionPage({super.key});

  @override
  State<CancionPage> createState() => _CancionPageState();
}

class _CancionPageState extends State<CancionPage> {
  

  int menuactivo = 0;
  bool isPlaying = true;
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
          nombreCancion("Verano Sin Ti"),
          separador(5),
          nombreArtista("Bad Bunny"),
          separador(15),
          barraPlay(),
          separador(20),
          botones(),
          separador(70),
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
      height: 400,
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
        Color.fromARGB(255, 54, 92, 214),
        Color.fromARGB(255, 77, 64, 167),
        Color.fromARGB(255, 15, 14, 14),
        Color.fromARGB(255, 8, 8, 8),
      ],
    ));
  }

  nombreCancion(String titulo){
       return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 0, top: 0),
        child: Text(
          titulo,
          style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
      margin: EdgeInsets.only(left: 25, right: 25),
      width: 400,
      height: 35,
    );
  }

  nombreArtista(String titulo){
       return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 0, top: 0),
        child: Text(
          titulo,
          style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 18,
              color: Color.fromARGB(255, 204, 204, 204),
              fontWeight: FontWeight.bold),
        ),
      ),
      margin: EdgeInsets.only(left: 30, right: 25),
      width: 400,
      height: 35,
      // decoration: BoxDecoration(
      //     color: Color.fromARGB(108, 255, 255, 255),
      //     borderRadius: BorderRadius.circular(15)),
    );
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

  barraPlay() {
     return Container(
      child:Slider(
              activeColor: Color.fromARGB(255, 151, 99, 247),
              value: 0,
              min: 0,
              max: 200,
              onChanged: (value) {
                setState(() {
                  // _currentSliderValue = value;
                  null;
                });
                // seekSound();
              }),
      margin: EdgeInsets.only(left: 25, right: 25),
      width: 400,
      height: 30,
    );
  }


  botones() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
            padding: const EdgeInsets.only(left: 80, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(
                      FeatherIcons.shuffle,
                      color: Colors.white.withOpacity(0.8),
                      size: 25,
                    ),
                    onPressed: null),
                IconButton(
                    icon: Icon(
                      FeatherIcons.skipBack,
                      color: Colors.white.withOpacity(0.8),
                      size: 25,
                    ),
                    onPressed: null),
                IconButton(
                    iconSize: 50,
                    icon: Container(
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color: Color.fromARGB(255, 151, 99, 247)),
                      child: Center(
                        child: Icon(
                          FeatherIcons.play ,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPressed: () {
                      null;
                    }),
                IconButton(
                    icon: Icon(
                      FeatherIcons.skipForward,
                      color: Colors.white.withOpacity(0.8),
                      size: 25,
                    ),
                    onPressed: null),
                IconButton(
                    icon: Icon(
                       FeatherIcons.anchor,
                      color: Colors.white.withOpacity(0.8),
                      size: 25,
                    ),
                    onPressed: null)
              ],
            ),
    ) 
    );
  }
}
