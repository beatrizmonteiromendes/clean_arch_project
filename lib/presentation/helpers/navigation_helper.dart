import 'package:clean_arch_rock_n_roll/domain/domain.dart';
import 'package:clean_arch_rock_n_roll/routes/routes_app.dart';
import 'package:flutter/material.dart';



class NavigationHelper {
  static void goToConcertInfo(
    BuildContext context,
    Map<String, double> coordinates,
    LocationEntity location,
  ) {
    Navigator.pushNamed(
      context,
      Routes.concertInfo,
      arguments: {
        'coordinates': coordinates,
        'location': "${location.city}, ${location.country}",
      },
    );
  }
}