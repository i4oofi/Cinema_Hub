// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cinema_hub/constants.dart';
import 'package:cinema_hub/features/splash/presentation/controller/bloc/splash_state.dart';

import 'splash_event.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<StartSplashAnimation>(_onStartAnimation);
  }

  Future<void> _onStartAnimation(
    StartSplashAnimation event,
    Emitter<SplashState> emit,
  ) async {
    emit(state.copyWith(isLogoVisible: true));
    await Future.delayed(kTransitionDuration);
    emit(state.copyWith(isTextVisible: true));

    // Wait for animations to complete
    await Future.delayed(const Duration(seconds: 2));
    // Emit navigation state
    emit(state.copyWith(shouldNavigate: true));
  }
}
