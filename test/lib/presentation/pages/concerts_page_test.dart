import 'package:clean_arch_rock_n_roll/presentation/pages/concerts_page.dart';
import 'package:clean_arch_rock_n_roll/presentation/widgets/show_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets(
    'Should show ConcertsScreen widget',
    (tester) async {
      await tester.pumpWidget(
        ScreenUtilInit(
          builder: (context, child) {
            return const MaterialApp(
              home: Scaffold(
                body: ConcertsPage(),
              ),
            );
          },
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text("Concerts Cities"), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.byType(ConcertsList), findsOneWidget);
    },
  );
}