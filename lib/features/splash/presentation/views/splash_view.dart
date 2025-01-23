import 'package:cinema_hub/features/splash/presentation/views/controller/bloc/splash_bloc.dart';
import 'package:cinema_hub/features/splash/presentation/views/controller/bloc/splash_event.dart';
import 'package:cinema_hub/features/splash/presentation/views/controller/bloc/splash_state.dart';
import 'package:cinema_hub/features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(StartSplashAnimation()),
      child: BlocListener<SplashBloc, SplashState>(
        listenWhen: (previous, current) =>
            previous.shouldNavigate != current.shouldNavigate,
        listener: (context, state) {
          if (state.shouldNavigate) {
            context.goNamed('home');
          }
        },
        child: const Scaffold(
          body: SplashViewBody(),
        ),
      ),
    );
  }
}
