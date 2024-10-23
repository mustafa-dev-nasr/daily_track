import 'dart:io';

import 'package:daily_track/core/routing/route.dart';
import 'package:daily_track/features/onboarding/ui/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

import '../../features/home/ui/screens/home_screen.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
          settings: settings,
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) =>  HomeScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Unknown route")),
          ),
        );
    }
  }
}
