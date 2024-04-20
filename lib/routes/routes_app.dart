import 'package:clean_arch_rock_n_roll/presentation/pages/concerts_page.dart';
import 'package:clean_arch_rock_n_roll/presentation/pages/info_page.dart';
import 'package:flutter/material.dart';


Route<dynamic> routesController(RouteSettings settings) {
  switch (settings.name) {
    case Routes.concerts:
      return MaterialPageRoute(
        builder: (context) => const ConcertsPage(),
      );
    case Routes.concertInfo:
      final arguments = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (context) => ConcertInfoPage(
          arguments: arguments,
        ),
      );
    default:
      throw ('the specified route is unavailable!');
  }
}

class Routes {
  static const String concerts = '/concerts';
  static const String concertInfo = '/concert/info';
}