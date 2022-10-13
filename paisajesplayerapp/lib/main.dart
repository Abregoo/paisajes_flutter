import 'package:flutter/material.dart';
import 'package:paisajesplayerapp/pages/main_app.dart';
import 'package:paisajesplayerapp/router/app_routes.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const MainApp(),
    initialRoute: AppRoutes.initialRoute,
    routes: AppRoutes.getAppRoutes(),
    onGenerateRoute: AppRoutes.onGenerateRoute,
  ));
}
