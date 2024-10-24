import 'package:daily_track/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/route.dart';
import 'core/theming/app_colors.dart';
import 'features/add_info/ui/screen/add_info_view.dart';
import 'features/add_info/ui/widgets/add_enfo_body.dart';
import 'features/home_page/ui/screens/home_page.dart';
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
            primaryColor: prymary,
            scaffoldBackgroundColor: white,
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
          // initialRoute:
          //       Routes.onBoardingScreen ,
          // home: const Addinfo(),
          home: const AddMemberView(),
        );
      },
    );
  }
}
