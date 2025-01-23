import 'package:cinema_hub/app_router.dart';
import 'package:cinema_hub/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CinemaHub());
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
