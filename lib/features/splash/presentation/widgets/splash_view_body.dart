import 'package:cinema_hub/core/utils/assets_data.dart';
import 'package:cinema_hub/features/splash/presentation/controller/bloc/splash_bloc.dart';
import 'package:cinema_hub/features/splash/presentation/controller/bloc/splash_event.dart';
import 'package:cinema_hub/features/splash/presentation/controller/bloc/splash_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(StartSplashAnimation()),
      child: BlocBuilder<SplashBloc, SplashState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AnimatedOpacity(
                opacity: state.isLogoVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeIn,
                child: SvgPicture.asset(
                  AssetsData.logo,
                  width: 350,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedOpacity(
                opacity: state.isTextVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Center(
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          'Your Gateway to Movies',
                          speed: const Duration(milliseconds: 80),
                          textStyle: const TextStyle(
                            letterSpacing: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                      isRepeatingAnimation: false,
                      displayFullTextOnTap: true,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
