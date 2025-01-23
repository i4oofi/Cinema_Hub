import 'package:cinema_hub/features/home/presentation/views/home_view.dart';
import 'package:cinema_hub/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

final router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const SplashView(),
      pageBuilder: (context, state) {
        return CustomFadeTransitionPage(
          key: state.pageKey,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeIn,
          child: const SplashView(),
        );
      },
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      pageBuilder: (context, state) {
        return CustomFadeTransitionPage(
          key: state.pageKey,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
          child: const HomeView(),
        );
      },
    ),
  ],
);

class CustomFadeTransitionPage extends CustomTransitionPage {
  CustomFadeTransitionPage({
    required super.key,
    required super.child,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) : super(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: curve,
              ),
              child: child,
            );
          },
          transitionDuration: duration,
        );
}
