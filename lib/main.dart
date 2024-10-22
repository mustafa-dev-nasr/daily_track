import 'package:daily_track/daily_track_app.dart';
import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';

void main() {
  runApp(DailyTrackApp(
    appRouter: AppRouter(),
  ));
}
