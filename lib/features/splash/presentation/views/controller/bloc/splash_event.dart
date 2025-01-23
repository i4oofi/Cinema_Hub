import 'package:equatable/equatable.dart';

// Events
abstract class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

class StartSplashAnimation extends SplashEvent {}
