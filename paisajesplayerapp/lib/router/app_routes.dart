import 'package:flutter/material.dart';
import 'package:paisajesplayerapp/models/menu_option.dart';
import 'package:paisajesplayerapp/pages/home_page.dart';
import 'package:paisajesplayerapp/pages/info_page.dart';
import 'package:paisajesplayerapp/pages/lista_page.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'infocard', name: 'Informacion', screen: const CardInfo()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => HomePage()});

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => HomePage(),
    );
  }
}
