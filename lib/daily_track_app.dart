import 'package:daily_track/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/route.dart';
import 'core/theming/app_colors.dart';
import 'features/home_page/ui/screens/home_page.dart';
import 'features/onboarding/ui/screens/onboarding_screen.dart';
import 'generated/l10n.dart';

class DailyTrackApp extends StatelessWidget {
  final AppRouter appRouter;
  // final bool isLoggedIn;

  const DailyTrackApp({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFFEEF1F8),
            primarySwatch: Colors.blue,
            fontFamily: "Intel",
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: Colors.white,
              errorStyle: TextStyle(height: 0),
              // border: defaultInputBorder,
              // enabledBorder: defaultInputBorder,
              // focusedBorder: defaultInputBorder,
              // errorBorder: defaultInputBorder,
            ),
          ),
          onGenerateRoute: appRouter.generateRoute,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: const Locale('ar'),
          title: 'daliy tasks',
          initialRoute: Routes.onBoardingScreen,
          // home: const OnboardingScreen(),
          // // home: const Addinfo(),
          // home: const AddMemberView(),
        );
      },
    );
  }
}
