import 'package:cinema_hub/features/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      body: HomeViewBody(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
