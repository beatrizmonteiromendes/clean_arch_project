import 'package:clean_arch_rock_n_roll/presentation/helpers/helpers.dart';
import 'package:clean_arch_rock_n_roll/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class WeatherForecastLoader extends StatelessWidget {
  const WeatherForecastLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i <= 5; i++)
          Container(
            margin: EdgeInsets.only(
              bottom: Responsive.isMobile ? 32 : 56,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: shimmer(),
                ),
                SizedBox(width: Responsive.isMobile ? 28 : 32),
                Expanded(
                  flex: 4,
                  child: shimmer(),
                ),
                SizedBox(width: Responsive.isMobile ? 28 : 32),
                Expanded(
                  child: shimmer(),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget shimmer() {
    return Shimmer.fromColors(
      baseColor: AppColors.grey,
      highlightColor: AppColors.lightGray,
      child: Container(
        height: Responsive.isMobile ? 18 : 22,
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}