part of 'onboarding_cubit.dart';

sealed class OnboardingState {
  int currentPage;
  OnboardingState({required this.currentPage});
}

final class OnboardingInitial extends OnboardingState {
  OnboardingInitial() : super(currentPage: 0);
}
final class OnboardingPageChanged extends OnboardingState {
  OnboardingPageChanged(int currentPage) : super(currentPage: currentPage);
}
