import 'package:cinema_hub/core/utils/app_router.dart';
import 'package:cinema_hub/constants.dart';
import 'package:cinema_hub/core/utils/service_locator.dart';
import 'package:cinema_hub/features/home/domain/entities/home_entity.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  runApp(const CinemaHub());
  setupLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(HomeEntityAdapter());
  await Hive.openBox(kFeaturedBox);
}

class CinemaHub extends StatelessWidget {
  const CinemaHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: ThemeData.dark().textTheme.apply(
              fontFamily: kPoppins,
            ),
      ),
    );
  }
}
