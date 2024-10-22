import 'dart:io';

import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
        // case Routes.proplemReview:
        // return MaterialPageRoute(
        //   builder: (context) => const ProplemDetailsView(),
        //   settings: settings,
        // );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Unknown route")),
          ),
        );
    }
  }
}
