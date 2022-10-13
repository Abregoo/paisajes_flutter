import 'package:flutter/material.dart';
import 'package:paisajesplayerapp/pages/datos.dart';
import 'package:paisajesplayerapp/pages/home_page.dart';

class ListaAlbum extends StatelessWidget {
  final Datos datos;

  const ListaAlbum({super.key, required this.datos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Listview Tipo 1'),
        ),
        body: ListView.separated(
          itemCount: datos.songsSend.length,
          itemBuilder: (context, i) => ListTile(
            title: Text(datos.songsSend[i]['title'] +
                ' - ' +
                datos.songsSend[i]['autor']),
            trailing: const Icon(
              Icons.music_video_rounded,
              color: Colors.indigo,
            ),
            onTap: () {},
          ),
          separatorBuilder: (_, __) => const Divider(),
        ));
  }
}
