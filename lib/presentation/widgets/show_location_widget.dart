import 'package:clean_arch_rock_n_roll/presentation/helpers/helpers.dart';
import 'package:clean_arch_rock_n_roll/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class ConcertLocation extends StatelessWidget {
  const ConcertLocation({
    super.key,
    required this.city,
    required this.note,
    required this.country,
    this.onPressed,
  });

  final String city, note, country;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.textTheme;
    final isMobile = Responsive.isMobile;

    return Container(
      margin: EdgeInsets.only(bottom: isMobile ? 38 : 56),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  country.toLowerCase(),
                  style: textTheme.bodyMedium?.copyWith(
                    color: AppColors.lightGray,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  note.toLowerCase(),
                  style: textTheme.bodyMedium?.copyWith(
                    color: AppColors.lightGray,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 3),
            Text(
              city.toLowerCase(),
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}