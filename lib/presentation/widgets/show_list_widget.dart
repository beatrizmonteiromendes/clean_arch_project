import 'package:clean_arch_rock_n_roll/data/const/constants.dart';
import 'package:clean_arch_rock_n_roll/presentation/helpers/location_helper.dart';
import 'package:clean_arch_rock_n_roll/presentation/widgets/show_location_widget.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/location_entity.dart';


class ConcertsList extends StatefulWidget {
  const ConcertsList({
    super.key,
    required this.locations,
    required this.loadingStates,
  });

  final List locations;
  final Map<String, ValueNotifier<bool>> loadingStates;

  @override
  State<ConcertsList> createState() => _ConcertsListState();
}

class _ConcertsListState extends State<ConcertsList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: widget.locations.length,
        itemBuilder: (context, index) {
          final LocationEntity location = widget.locations[index];

          return ValueListenableBuilder(
            valueListenable:
                widget.loadingStates[location.city] ?? ValueNotifier(false),
            builder: (context, loading, child) {
              return ConcertLocation(
                country: location.country,
                city: location.city,
                note: loading
                    ? Constants.gatheringCoordinates
                    : Constants.clickForMore,
                onPressed: () => LocationHelper.getCoordinates(
                  context,
                  location,
                  widget.loadingStates,
                ),
              );
            },
          );
        },
      ),
    );
  }
}