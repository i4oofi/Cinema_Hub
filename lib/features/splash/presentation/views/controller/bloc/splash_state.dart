import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  final bool isLogoVisible;
  final bool isTextVisible;
  final bool shouldNavigate; // أضفنا هذا البارامتر

  const SplashState({
    this.isLogoVisible = false,
    this.isTextVisible = false,
    this.shouldNavigate = false, // القيمة الافتراضية
  });

  SplashState copyWith({
    bool? isLogoVisible,
    bool? isTextVisible,
    bool? shouldNavigate, // أضفنا هذا البارامتر في copyWith
  }) {
    return SplashState(
      isLogoVisible: isLogoVisible ?? this.isLogoVisible,
      isTextVisible: isTextVisible ?? this.isTextVisible,
      shouldNavigate: shouldNavigate ?? this.shouldNavigate,
    );
  }

  @override
  List<Object> get props => [isLogoVisible, isTextVisible, shouldNavigate];
}
